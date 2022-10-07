if ($IsWindows)
{
  if (Get-Command -Name 'scoop' -ErrorAction SilentlyContinue)
  {
    Write-Host "Scoop is already installed." -f White
  } else
  {
    Write-Host "Installing Scoop..."
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
  }

  if (Get-Command -Name 'python3' -ErrorAction SilentlyContinue)
  {
    Write-Host "Python3 is already installed." -f White
  } else
  {
    scoop install python
    pip install pynvim
  }

  if (Get-Command -Name 'lazygit' -ErrorAction SilentlyContinue)
  {
    Write-Host "lazygit is already installed." -f White
  } else
  {
    scoop install lazygit
  }

  if (Get-Command -Name 'bat' -ErrorAction SilentlyContinue)
  {
    Write-Host "bat is already installed." -f White
  } else
  {
    scoop install bat
  }

  if (Get-Command -Name 'rg' -ErrorAction SilentlyContinue)
  {
    Write-Host "ripgrep is already installed." -f White
  } else
  {
    scoop install ripgrep 
  }

  if (Get-Command -Name 'fd' -ErrorAction SilentlyContinue)
  {
    Write-Host "fd is already installed." -f White
  } else
  {
    scoop install fd
  }

  if (Get-Command -Name 'nvim' -ErrorAction SilentlyContinue)
  {
    Write-Host "Neovim is already installed." -f White
  } else
  {
    scoop install neovim-nightly
  }
}
