Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB032D979F;
	Tue, 27 Jan 2026 09:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507912; cv=none; b=sd6mrEknlxJ0n74TX/mCOxFHAcCx2W+ou/TH4GmYhyWDd/7FKVwUMF+kkUHsyrTdNHXtt/2aDyBdjfAe7PSUVhbSIElwTCYAzOdPvp8/X6XAqJlPpHXyMK9UA6u9SECl74NBrzWPeu1H327K6kLWarIkom0oEZJDwVLU+iG9EL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507912; c=relaxed/simple;
	bh=AzrFVW593Ai5xx9FLIVRL8w0+432x7sxOT+xZPYWQ9I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AiipVe5bt5Fp9japiny3USAv3zuH5hfzuwDPWUVH3AlUSk8GDNBLLWBbYydqFPWKWmMSwnOd5cL32T8F96W6ZQ8jhUh2+VqdbRthxAbwrzIa+lu22w+aVUVn+U4JEL+05Kz5Q4afi3vRxRvbf6Zs8r9vqq2/ESjQTkQ+TIckeQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=sQQb48HB; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="sQQb48HB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=WJ9jgq557aIsoOVME2r7v0yn0vgjgXIa6N0hsPBKqn8=; b=sQQb48HBG+b0VeueUk4xrXCjNA
	anX8G22s/Ml4agj5ItKvSqkeMRm+IxKUJwh4q68x8ByL6wb5iJJq97l5LDgGgfzP7FlR0Uwc3I3MX
	hPfFQPka0dGpGNSuLSbRcH34y08I/to1vL4m3rvEH2iAeHMeggGiQuLNkht4HLgwKIV/v2uVvpHo2
	OVYVnsc3rWRN7uw2LnDW1nV9+6Rskscr73br0ViBNGhARsW1Hp/5HnsUn9GH+Z1VCNgUtZBc0nx2x
	ZPk9Yp6vZX02b15ndZXXuroCuKDQPd9nlyV9UiIU60BHh9HT9foXtF0oteHcsHmx67YiEjFZrBiCc
	E65KC7Ww==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vkfq5-00GuDv-FA; Tue, 27 Jan 2026 09:58:25 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH] ipmi: fix NULL pointer on smi_work
Date: Tue, 27 Jan 2026 01:57:58 -0800
Message-Id: <20260127-ipmi-v1-0-ba5cc90f516f@debian.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACeMeGkC/yXMzQpAQBSG4Vs5fWtTY4iaW5HFDAdH+WkGKbl3Y
 fkunvdC5CAcYelC4EOiLDMspQmhGdzcs5IWlmC0KXRqSiXrJEpn3nHutCl9i4SwBu7k/DZV/Xf
 c/cjN9lrc9wPqKL8uaAAAAA==
X-Change-ID: 20260127-ipmi-03bae4a027bd
To: Corey Minyard <corey@minyard.net>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.15-dev-deb6e
X-Developer-Signature: v=1; a=openpgp-sha256; l=5642; i=leitao@debian.org;
 h=from:subject:message-id; bh=AzrFVW593Ai5xx9FLIVRL8w0+432x7sxOT+xZPYWQ9I=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpeIw8mu+6XKANhhl0lz0RZKytOQ5n1QSt91NOc
 v0dx6v696iJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaXiMPAAKCRA1o5Of/Hh3
 bZr0EACvJonjnKi05xumnr6YGTcs8tOo/xIu6pfWSWMhvdwlATwh+ygE0D38BiTj0M4+oBxhRbi
 SK+qwGHAzwhmI2PMoWnwGg/CTuszR+h6Vf1DlLfI7ZGW2iq0rGl84Wc3VqZhPQyvVYjK5wteSgX
 rsG3g2Nq9PAI9O1JgjtFvzP77Vt1z79xhY7IomPMyGg1m5TociFZuKFRpsZL5g5DO/RdLgA578F
 tVvcV1kZJGpnpS17yh23CT12pfY6E4AdsQw0+0JcduiBGdETjiApHH59/8OZeiIZjhtvX5o7C//
 4TBFEiK5ruyj76MyF89n7/kLsua9fPmNEHjOIK4ZIzctHAouF9Zv5sUhMewVDYrz5HxzY3EqY9W
 CJoVCVKCCXUfx6weRojJU8oylNHL2TsIlnDj24lwl5wxOIa3ytgt6UUN0pVwcEwB+jvBGalmW7/
 ShP6qzj2o9cCGaXKkD4r1Itdr4zK6m+ncfz0NaqBNtAF0AzobDwJ6DwV8LExImzxGc03lzyQtKU
 s/1Vh3h+G2O0bohTnIpXU525o/vdMvJMSE/rm3VCFxDiBZgWOQwxTeFPBNDdwxZ6vJCUn/1t1HL
 HMjEXUu8M0v33MOlNjgDvbKxqc35hY9he0lQ5k2GrH4WdiBohruNwHzY2vhn7atnSUteT1PZagL
 immTvRw2GSJYFwg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

I am getting the following crash on IPMI on linus' upstream. It tries to
double-add the same element to a list, and then get
a slab-use-after-free in handle_one_recv_msg.

Here is the decoded stack against commit cf38b2340c0e ("Merge tag
'soc-fixes-6.19-2' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc")

	list_add double add: new=ffff888145b19000, prev=ffff888145b19000, next=ffff88810bb6d480.
	  WARNING: lib/list_debug.c:37 at __list_add_valid_or_report+0x10a/0x130, CPU#64: 0/408
	  Workqueue: events smi_work [ipmi_msghandler]
	  RIP: 0010:__list_add_valid_or_report (rw/compile/lib/list_debug.c:35)

	  deliver_response (rw/compile/./include/linux/list.h:158 rw/compile/./include/linux/list.h:191 rw/compile/drivers/char/ipmi/ipmi_msghandler.c:974) ipmi_msghandler
	  smi_work (rw/compile/drivers/char/ipmi/ipmi_msghandler.c:985 rw/compile/drivers/char/ipmi/ipmi_msghandler.c:999 rw/compile/drivers/char/ipmi/ipmi_msghandler.c:4853) ipmi_msghandler
	  ? process_scheduled_works (rw/compile/kernel/workqueue.c:3233 rw/compile/kernel/workqueue.c:3340)
	  process_scheduled_works (rw/compile/kernel/workqueue.c:? rw/compile/kernel/workqueue.c:3340)
	  worker_thread (rw/compile/./include/linux/list.h:381 rw/compile/kernel/workqueue.c:946 rw/compile/kernel/workqueue.c:3422)
	  kthread (rw/compile/kernel/kthread.c:465)
	  ? pr_cont_work (rw/compile/kernel/workqueue.c:3367)
	  ? kthread_blkcg (rw/compile/kernel/kthread.c:412)
	  ret_from_fork (rw/compile/arch/x86/kernel/process.c:164)
	  ? kthread_blkcg (rw/compile/kernel/kthread.c:412)
	  ret_from_fork_asm (rw/compile/arch/x86/entry/entry_64.S:256)

	list_add double add: new=ffff888145b19000, prev=ffff888145b19000, next=ffff88810bb6d480.
	  WARNING: lib/list_debug.c:37 at __list_add_valid_or_report+0x10a/0x130, CPU#64: 0/408
	  <double add hit again same stack>

	BUG: KASAN: slab-use-after-free in handle_one_recv_msg (rw/compile/drivers/char/ipmi/ipmi_msghandler.c:? rw/compile/drivers/char/ipmi/ipmi_msghandler.c:4761) ipmi_msghandler
	  T473136] Write of size 4 at addr ffff888145b19010 by task kworker/30:3/473136
	  handle_new_recv_msgs (rw/compile/drivers/char/ipmi/ipmi_msghandler.c:4788) ipmi_msghandler
	  ? get_smi_info (rw/compile/drivers/char/ipmi/ipmi_si_intf.c:918) ipmi_si
	  smi_work (rw/compile/drivers/char/ipmi/ipmi_msghandler.c:?) ipmi_msghandler
	  ? process_scheduled_works (rw/compile/kernel/workqueue.c:3233 rw/compile/kernel/workqueue.c:3340)
	  process_scheduled_works (rw/compile/kernel/workqueue.c:? rw/compile/kernel/workqueue.c:3340)
	  worker_thread (rw/compile/./include/linux/list.h:381 rw/compile/kernel/workqueue.c:946 rw/compile/kernel/workqueue.c:3422)
	  kthread (rw/compile/kernel/kthread.c:465)
	  ? rcu_is_watching (rw/compile/./include/linux/context_tracking.h:128 rw/compile/kernel/rcu/tree.c:751)
	  ? pr_cont_work (rw/compile/kernel/workqueue.c:3367)
	  ? kthread_blkcg (rw/compile/kernel/kthread.c:412)
	  ret_from_fork (rw/compile/arch/x86/kernel/process.c:164)
	  ? kthread_blkcg (rw/compile/kernel/kthread.c:412)
	  ret_from_fork_asm (rw/compile/arch/x86/entry/entry_64.S:256)

	Allocated by task 6379:
	  kasan_save_track (rw/compile/mm/kasan/common.c:58 rw/compile/mm/kasan/common.c:78)
	  __kasan_kmalloc (rw/compile/mm/kasan/common.c:419)
	  __kmalloc_cache_noprof (rw/compile/mm/slub.c:5781)
	  kernfs_fop_open.llvm.1481521202032378051 (rw/compile/./include/linux/slab.h:957 rw/compile/./include/linux/slab.h:1094 rw/compile/fs/kernfs/file.c:641)
	  do_dentry_open (rw/compile/fs/open.c:963)
	  vfs_open (rw/compile/fs/open.c:1095)
	  path_openat (rw/compile/fs/namei.c:4638 rw/compile/fs/namei.c:4796)
	  do_filp_open (rw/compile/fs/namei.c:4823)
	  do_sys_openat2 (rw/compile/./include/linux/err.h:78 rw/compile/./include/linux/file.h:177 rw/compile/fs/open.c:1430)
	  __x64_sys_openat (rw/compile/fs/open.c:1447)
	  do_syscall_64 (rw/compile/arch/x86/entry/syscall_64.c:?)
	  entry_SYSCALL_64_after_hwframe (rw/compile/arch/x86/entry/entry_64.S:131)

	Freed by task 6379:
	  kasan_save_track (rw/compile/mm/kasan/common.c:58 rw/compile/mm/kasan/common.c:78)
	  kasan_save_free_info (rw/compile/mm/kasan/generic.c:587)
	  __kasan_slab_free (rw/compile/mm/kasan/common.c:287)
	  kfree (rw/compile/mm/slub.c:6674 rw/compile/mm/slub.c:6882)
	  kernfs_fop_release.llvm.1481521202032378051 (rw/compile/fs/kernfs/file.c:788)
	  __fput (rw/compile/fs/file_table.c:469)
	  fput_close_sync (rw/compile/fs/file_table.c:574)
	  __x64_sys_close (rw/compile/fs/open.c:1575 rw/compile/fs/open.c:1558 rw/compile/fs/open.c:1558)
	  do_syscall_64 (rw/compile/arch/x86/entry/syscall_64.c:?)
	  entry_SYSCALL_64_after_hwframe (rw/compile/arch/x86/entry/entry_64.S:131)

	  BUG: kernel NULL pointer dereference, address: 0000000000000000
	  #PF: supervisor instruction fetch in kernel mode
	  #PF: error_code(0x0010) - not-present page
	  PGD 1d14bb067 P4D 1d14bb067 PUD 67c50d067 PMD 0
	  Oops: Oops: 0010 [#1] SMP DEBUG_PAGEALLOC KASAN
	  Hardware name: Quanta North Dome MP/North Dome MP, BIOS F09C_3B14.sign 04/12/2023
	  Workqueue: events smi_work [ipmi_msghandler]

The next patch contains the issue I found and a possible fix.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Breno Leitao (1):
      ipmi: Fix use-after-free and list corruption on sender error

 drivers/char/ipmi/ipmi_msghandler.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)
---
base-commit: cf38b2340c0e60ef695b7137440a4d187ed49c88
change-id: 20260127-ipmi-03bae4a027bd

Best regards,
--  
Breno Leitao <leitao@debian.org>

