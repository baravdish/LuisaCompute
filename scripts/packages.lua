local _sdks = {
    dx_sdk = {
        -- from:
        --> xmake l hash.sha256 SDKs/x64/dx_sdk_20240611.zip
        sha256 = "0bd0a15ec34921087ec304ea1dc92ef9e6a6305b2231dcd850854b8270651b4e",
        name = 'dx_sdk_20240611.zip',
    }
}

function sdk_address(sdk)
    return sdk['address'] or 'https://github.com/LuisaGroup/SDKs/releases/download/sdk/'
end
function sdk_mirror_addresses(sdk)
    return sdk['mirror_addresses'] or {}
end
function sdks()
    return _sdks
end
function sdk_dir(arch, custom_dir)
    if custom_dir then
        if not path.is_absolute(custom_dir) then
            custom_dir = path.absolute(custom_dir, os.projectdir())
        end
    else
        custom_dir = path.join(os.projectdir(), 'SDKs/')
    end
    return path.join(custom_dir, arch)
end

function get_or_create_sdk_dir(arch, custom_dir)
    local dir = sdk_dir(arch, custom_dir)
    local lib = import('lib')
    lib.mkdirs(dir)
    return dir
end
