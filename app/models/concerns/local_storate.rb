module LocalStorage
  extend ActiveSupport::Concern
  def store(dir, file_name, body, options = {})
    options[:encoding] ||= 'utf-8'

    bucket = options[:bucket] || ''
    dirname = File.dirname(file_name)
    filename = File.basename(file_name)
    write_dir = File.join('public', bucket, dir, dirname)
    FileUtils.mkdir_p(write_dir)

    body = body.read if body.respond_to? :read

    File.open("#{write_dir}/#{filename}", 'wb', encoding: options[:encoding]) do |f|
      f.write(body)
    end
  end

  def delete(dir, file_name, options = {})
    bucket = options[:bucket] || ''
    dirname = File.dirname(file_name)
    filename = File.basename(file_name)
    file = File.join('public', bucket, dir, dirname, filename)

    FileUtils.rm(file) if File.exist?(file)
  end

  def storage_path(dir, file_name, _options = {})
    File.join(dir, file_name)
  end

  def full_path(dir, file_name)
    Rails.root.join('public', dir, file_name).to_s
  end

  def paperclip_path(path)
    ":rails_root/public/:system/#{path}"
  end

  def paperclip_url(path)
    "/:system/#{path}"
  end
end
