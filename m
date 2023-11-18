Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4915D360
	for <llvm@lists.linux.dev>; Sat, 18 Nov 2023 00:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xXjCFVkR"
Date: Fri, 17 Nov 2023 19:12:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1700266331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=5FVAKS5ltDgwPPIwb1Ip7xIFoajwjgcDs/TVLxkTdJY=;
	b=xXjCFVkRNap66GBbD/LeH89AQgjonxYpKajFJisJzSUKXRGNFA4kkfdopbw8RcIW6PuWAD
	3mEOYox8t+O7WCc6HliJtQw+vcbrWZRspq47JiAozCF+gHT2yB+d23bvV2QiCi3ecR/02g
	fTfCk8Zu0vGJvXL4leRDiGXH9OkRkSU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: llvm@lists.linux.dev
Cc: Kees Cook <keescook@chromium.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: CFI support for type punning?
Message-ID: <20231118001208.narka6bl3axdpflf@moria.home.lan>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT

I received the following report

[  228.366640] bcachefs (loop0): mounting version 1.3: rebalance_work
[  228.366652] bcachefs (loop0): initializing new filesystem
[  228.366910] bcachefs (loop0): going read-write
[  228.367619] CFI failure at process_scheduled_works+0x273/0x4a0 (target: btree_update_set_nodes_written+0x0/0x50; expected type: 0xb86001b6 
[  228.367645] WARNING: CPU: 3 PID: 11 at process_scheduled_works (kernel/workqueue.c:2630 kernel/workqueue.c:2703) 
[  228.367653] CPU: 3 PID: 11 Comm: kworker/u48:0 Tainted: G                T  6.7.0-rc1+ #1
[  228.367660] Hardware name: Micro-Star International Co., Ltd. MS-7D25/PRO Z690-A DDR4(MS-7D25), BIOS Dasharo (coreboot+UEFI) v1.1.1 02/22/2023
[  228.367663] Workqueue: btree_update btree_update_set_nodes_written
[  228.367671] RIP: 0010:process_scheduled_works (kernel/workqueue.c:2630 kernel/workqueue.c:2703) 
[ 228.367679] Code: 24 fc 00 49 ff 87 98 00 00 00 4c 89 ef e8 e5 3e 77 01 0f 1f 44 00 00 4c 8b 5b 18 4c 89 f7 41 ba 4a fe 9f 47 45 03 53 f1 74 02 <0f> 0b 41 ff d3 0f 1f 00 48 8b 53 18 0f 1f 44 00 00 49 ff 87 a0 00
All code
========

Code starting with the faulting instruction
===========================================
[  228.367683] RSP: 0018:ffffc90000093e58 EFLAGS: 00010213
[  228.367688] RAX: 0000000000000000 RBX: ffff88810018a900 RCX: ffff88815082c605
[  228.367692] RDX: ffff888100216428 RSI: 0000000000000000 RDI: ffff88810d41e000
[  228.367694] RBP: ffff888140bddcb0 R08: 0000000000000000 R09: 0000000000000000
[  228.367697] R10: 000000003c094208 R11: ffffffff8814ea20 R12: ffff88810d41e008
[  228.367699] R13: ffff888100216400 R14: ffff88810d41e000 R15: ffff88815082c600
[  228.367702] FS:  0000000000000000(0000) GS:ffff88888f380000(0000) knlGS:0000000000000000
[  228.367706] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  228.367709] CR2: 00007f884730dff0 CR3: 000000014088c000 CR4: 0000000000b50ef0
[  228.367713] Call Trace:
[  228.367716]  <TASK>
[  228.367719] ? __warn (kernel/panic.c:236 kernel/panic.c:677) 
[  228.367726] ? process_scheduled_works (kernel/workqueue.c:2630 kernel/workqueue.c:2703) 
[  228.367733] ? report_cfi_failure (kernel/cfi.c:22) 
[  228.367740] ? handle_cfi_failure (arch/x86/kernel/cfi.c:80) 
[  228.367746] ? __cfi_btree_update_set_nodes_written (fs/bcachefs/btree_update_interior.c:786) 
[  228.367753] ? handle_bug (arch/x86/kernel/traps.c:238) 
[  228.367760] ? exc_invalid_op (arch/x86/kernel/traps.c:258) 
[  228.367766] ? asm_exc_invalid_op (./arch/x86/include/asm/idtentry.h:568) 
[  228.367772] ? __cfi_btree_update_set_nodes_written (fs/bcachefs/btree_update_interior.c:786) 
[  228.367778] ? process_scheduled_works (kernel/workqueue.c:2630 kernel/workqueue.c:2703) 
[  228.367784] ? process_scheduled_works (./arch/x86/include/asm/jump_label.h:27 ./include/linux/jump_label.h:207 ./include/trace/events/workqueue.h:82 kernel/workqueue.c:2629 kernel/workqueue.c:2703) 
[  228.367790] worker_thread (./include/linux/list.h:373 kernel/workqueue.c:841 kernel/workqueue.c:2785) 
[  228.367796] ? __cfi_worker_thread (kernel/workqueue.c:2730) 
[  228.367802] kthread (kernel/kthread.c:388) 
[  228.367809] ? __cfi_kthread (kernel/kthread.c:341) 
[  228.367816] ret_from_fork (arch/x86/kernel/process.c:147) 
[  228.367820] ? __cfi_kthread (kernel/kthread.c:341) 
[  228.367826] ret_from_fork_asm (arch/x86/entry/entry_64.S:250) 
[  228.367831]  </TASK>
[  228.367833] ---[ end trace 0000000000000000 ]---
[  228.368179] bcachefs (loop0): initializing freespace
[  228.369347] CFI failure at process_scheduled_works+0x273/0x4a0 (target: bch2_journal_write+0x0/0x1040; expected type: 0xb86001b6 
[  228.369370] WARNING: CPU: 19 PID: 496 at process_scheduled_works (kernel/workqueue.c:2630 kernel/workqueue.c:2703) 
[  228.369380] CPU: 19 PID: 496 Comm: kworker/19:1H Tainted: P                T  6.7.0-rc1+ #1
[  228.369388] Hardware name: Micro-Star International Co., Ltd. MS-7D25/PRO Z690-A DDR4(MS-7D25), BIOS Dasharo (coreboot+UEFI) v1.1.1 02/22/2023
[  228.369391] Workqueue: bcachefs_io bch2_journal_write
[  228.369400] RIP: 0010:process_scheduled_works (kernel/workqueue.c:2630 kernel/workqueue.c:2703) 
[ 228.369408] Code: 24 fc 00 49 ff 87 98 00 00 00 4c 89 ef e8 e5 3e 77 01 0f 1f 44 00 00 4c 8b 5b 18 4c 89 f7 41 ba 4a fe 9f 47 45 03 53 f1 74 02 <0f> 0b 41 ff d3 0f 1f 00 48 8b 53 18 0f 1f 44 00 00 49 ff 87 a0 00
All code

which indicates that bcache and bcachefs are both broken with CFI
enabled; closures (lib/closure.c, include/linux/closure.h) do type
punning with passing a void (closure_fn)(struct closure *) to the
workqueue code, which calls it as a void (workqueue_fn)(struct
work_struct *). That is, we're considering the closure to be the same as
the embedded/unioned work_struct, as far as the workqueue code is
considered.

Is there any way to tell the CFI code about this kind of type punning,
or would it be possible to add support for this?

The alternatives I'm looking at aren't terribly palatable; we'd either
have to increase the size of struct closure with another function
pointer (and another indirect function call on every use); or we'd have
to patch the workqueue code and add a flag (Tejun won't like that), or
I'll have to convert every closure function to take a work_struct arg -
with a resulting decrease in clarity of types.

Cheers,
Kent
