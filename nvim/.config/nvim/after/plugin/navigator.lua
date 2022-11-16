local navigator_ok, navigator = pcall(require, 'navigator')

if not navigator_ok then
	return
end

navigator.setup()
