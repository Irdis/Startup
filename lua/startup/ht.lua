return {
    {
        name = 'sso',
        cmds = {
            '"C:/Program Files/IIS Express/iisexpress.exe" /config:"c:\\Repo\\hazeltree\\app\\applicationhost.config" /site:"Hazeltree.SSO.Host" /apppool:"Hazeltree.SSO.Host AppPool"' 
        }
    },
    {
        name = 'main',
        cmds = {
            '"C:/Program Files/IIS Express/iisexpress.exe" /config:"c:\\Repo\\hazeltree\\app\\applicationhost.config" /apppool:"Clr4IntegratedAppPool"' 
        }
    },
    {
        name = 'job',
        cmds = {
            'c:\\Repo\\hazeltree\\app\\job\\HTFS.Common.Job.Service.exe' 
        }
    },
    {
        name = 'user',
        cmds = {
            'cd c:\\Repo\\hazeltree\\main\\HTFS\\Applications\\NetCoreHosts\\HazelTree.UserManagement.Host',
            'dotnet run --launch-profile HazelTree.UserManagement.Host'
        }
    },
    {
        name = 'aux',
        cmds = {
            'cd c:\\Repo\\hazeltree\\main\\HTFS\\Applications\\NetCoreHosts\\Hazeltree.Auxiliary.Host\\',
            'dotnet run --launch-profile Hazeltree.Auxiliary.Host'
        }
    },
    {
        name = 'gate',
        cmds = {
            'cd c:\\Repo\\hazeltree\\main\\HTFS',
            'dotnet build .\\Hazeltree.AtlasGateway.sln',
            'cd c:\\Repo\\hazeltree\\main\\HTFS\\Applications\\NetCoreHosts\\Hazeltree.AtlasGateway\\Hazeltree.AtlasGateway.WebApi',
            'dotnet run --launch-profile Hazeltree.AtlasGateway.WebApi-Local',
        }
    },
    {
        name = 'data',
        cmds = {
            'cd c:\\Repo\\hazeltree\\main\\HTFS\\Applications\\DataService\\Host',
            'dotnet run --no-build --launch-profile Hazeltree.DataService.Host'
        }
    },
    {
        name = 'message',
        cmds = {
            'cd C:\\Repo\\hazeltree\\main\\HTFS\\Applications\\MessageBus\\ServiceHost',
            'dotnet run --no-build --launch-profile Hazeltree.MessageBus.Atlas.ServiceHost'
        }
    },
    {
        name = 'collateral',
        cmds = {
            'cd c:\\Repo\\hazeltree\\collateral\\Collateral\\Hazeltree.Collateral.Host',
            'dotnet run --launch-profile Hazeltree.Collateral.Host'
        },
    },
}
