browser.commands.onCommand.addListener(async (cmd) => {
  const tabs = await browser.tabs.query({ currentWindow: true, hidden: false });
  const i = tabs.findIndex(t => t.active);
  const d = cmd === "next-tab" ? 1 : -1;
  await browser.tabs.update(tabs[(i + d + tabs.length) % tabs.length].id, { active: true });
});
