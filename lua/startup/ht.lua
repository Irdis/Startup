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
        name = 'white_dev',
        cmds = {
            '"C:/Program Files/IIS Express/iisexpress.exe" /config:"c:\\Repo\\hazeltree\\app\\whitehost.config" /apppool:"Clr4IntegratedAppPool"'
        },
        disabled = true
    },
    {
        name = 'job',
        cmds = {
            'c:\\Repo\\hazeltree\\app\\job\\HTFS.Common.Job.Service.exe'
        }
    },
    {
        name = 'white_job',
        cmds = {
            'C:\\Repo\\hazeltree\\WhiteApi\\HazelTree.AppTask.Service.Host\\bin\\Debug\\Hazeltree.AppTask.Service.Host.exe /console'
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
        name = 'notification',
        cmds = {
            'cd c:\\Repo\\hazeltree\\main\\HTFS\\Applications\\NetCoreHosts\\HazelTree.NotificationsService.Host',
            'dotnet run --launch-profile HazelTree.NotificationsService.Host'
        }
    },
    {
        name = 'report',
        cmds = {
            'cd c:\\Repo\\hazeltree\\main\\HTFS\\Applications\\NetCoreHosts\\Hazetree.ReportManager.Host\\',
            'dotnet run --launch-profile Hazetree.ReportManager.Host'
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
        name = 'aux_dev',
        cmds = {
            'cd C:\\Repo\\hazeltree\\auxiliary\\AuxiliaryApi\\Hazeltree.Auxiliary.Host',
            'dotnet run --launch-profile Hazeltree.Auxiliary.Host'
        },
        disabled = true
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
    {
        name = 'debt',
        cmds = {
            'cd c:\\Repo\\hazeltree\\main\\HTFS\\Applications\\NetCoreHosts\\Hazeltree.DebtManagement.API.Host',
            'dotnet run --launch-profile Hazeltree.DebtManagement.API.Host'
        },
    },
    {
        name = 'tran',
        cmds = {
            'cd C:\\Repo\\hazeltree\\main\\HTFS\\Applications\\NetCoreHosts\\Hazeltree.TransactionManager.API.Host',
            'dotnet run --launch-profile Hazeltree.TransactionManager.API.Host'
        },
    },
    {
        name = 'tran_dev',
        cmds = {
            'cd C:\\Repo\\hazeltree\\TransactionManager\\Hazeltree\\TransactionManager\\API\\Host',
            'dotnet run --project Hazeltree.TransactionManager.API.Host.csproj --launch-profile Hazeltree.TransactionManager.API.Host'
        },
        disabled = true
    },
    {
        name = 'optimizer',
        cmds = {
            'cd C:\\Repo\\hazeltree\\main\\HTFS\\Applications\\NetCoreHosts\\Optimizer\\Hazeltree.Optimizer.Host',
            'dotnet run --launch-profile Hazeltree.Optimizer.Host'
        },
    },
    {
        name = 'public_api_proxy',
        cmds = {
            'cd C:\\Repo\\hazeltree\\main\\HTFS\\Applications\\NetCoreHosts\\Hazeltree.PublicApiProxy',
            'dotnet run --launch-profile Hazeltree.PublicApiProxy-Local'
        },
    },
}
