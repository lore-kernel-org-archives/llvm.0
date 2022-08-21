Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125D536A
	for <llvm@lists.linux.dev>; Sun, 21 Aug 2022 02:04:25 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id c7-20020a056e020bc700b002e59be6ce85so5836378ilu.12
        for <llvm@lists.linux.dev>; Sat, 20 Aug 2022 19:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc;
        bh=A/zzpYW1tI4lloz1zH6jwjZDuRD2LG4tBGIDFKtm7Fk=;
        b=lDtiNF6xbQylnhul5ypOvV3bDzfoC5WtBgJZLGWuIZYK73iBNMLhA465WhWJHsQtmF
         ZQZJZ0xbpRVSb1Kt39mZBxBbcbD2Cc7880eIL94Uhll1mJCwZAatKs8s4+MGz3/w4Wn7
         VvRYbxF0jGloCDW9ZXhj88RnJtGWJ1Ob//pYPd348Tpo9tcHtuj5MV5usXCMgSUIz9x2
         xmq0PYqSJ8767qU/kqhapRUWtn9RT4LSpmF4jWo6AQ/jZqcT/IqhWPwqF6+m06mbdNx/
         BkZ4QmL3d5aUmbWItkQQCIY+7VWomO2fUD4hpRBpWiQW0C/oBDuU/5tdXJby5Ep21pn5
         C2qA==
X-Gm-Message-State: ACgBeo3IED4lZGmeNpn4kCgJo/nFe9C2kX5tSnVoxWw3k50gQmwVyr2Z
	EJYt2vIXwA4MsBjL7pBA/ZYrG4o2wXB/is6NzYaXLQG/JCcr
X-Google-Smtp-Source: AA6agR6GMU82BcVllkaESQsbE+fuErrxfN16OoFxjAi4lzVf2Mr1+qFfdbf2ZIzLsUN2FG/7tHBRHPqAsht+EW+jOZ2curz4lwVJ
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1482:b0:688:d06b:223e with SMTP id
 a2-20020a056602148200b00688d06b223emr6125885iow.3.1661047465195; Sat, 20 Aug
 2022 19:04:25 -0700 (PDT)
Date: Sat, 20 Aug 2022 19:04:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001e3e0305e6b6c076@google.com>
Subject: [syzbot] upstream boot error: BUG: unable to handle kernel paging
 request in kernfs_new_node
From: syzbot <syzbot+e80c44ef751cb1889491@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3cc40a443a04 Merge tag 'nios2_fixes_v6.0' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1053627b080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f267ed4fb258122a
dashboard link: https://syzkaller.appspot.com/bug?extid=e80c44ef751cb1889491
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e80c44ef751cb1889491@syzkaller.appspotmail.com

Console: switching to colour frame buffer device 128x48
platform vkms: [drm] fb0: vkmsdrmfb frame buffer device
usbcore: registered new interface driver udl
brd: module loaded
loop: module loaded
zram: Added device: zram0
null_blk: disk nullb0 created
null_blk: module loaded
Guest personality initialized and is inactive
VMCI host device registered (name=vmci, major=10, minor=120)
Initialized host personality
usbcore: registered new interface driver rtsx_usb
usbcore: registered new interface driver viperboard
usbcore: registered new interface driver dln2
usbcore: registered new interface driver pn533_usb
nfcsim 0.2 initialized
usbcore: registered new interface driver port100
usbcore: registered new interface driver nfcmrvl
Loading iSCSI transport class v2.0-870.
scsi host0: Virtio SCSI HBA
st: Version 20160209, fixed bufsize 32768, s/g segs 256
Rounding down aligned max_sectors from 4294967295 to 4294967288
db_root: cannot open: /etc/target
slram: not enough parameters.
ftl_cs: FTL header not found.
wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com for information.
wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
eql: Equalizer2002: Simon Janes (simon@ncm.com) and David S. Miller (davem@redhat.com)
MACsec IEEE 802.1AE
tun: Universal TUN/TAP device driver, 1.6
vcan: Virtual CAN interface driver
vxcan: Virtual CAN Tunnel driver
slcan: serial line CAN interface driver
CAN device driver interface
usbcore: registered new interface driver usb_8dev
usbcore: registered new interface driver ems_usb
usbcore: registered new interface driver gs_usb
usbcore: registered new interface driver kvaser_usb
usbcore: registered new interface driver mcba_usb
usbcore: registered new interface driver peak_usb
e100: Intel(R) PRO/100 Network Driver
e100: Copyright(c) 1999-2006 Intel Corporation
e1000: Intel(R) PRO/1000 Network Driver
e1000: Copyright (c) 1999-2006 Intel Corporation.
e1000e: Intel(R) PRO/1000 Network Driver
e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
mkiss: AX.25 Multikiss, Hans Albas PE1AYX
AX.25: 6pack driver, Revision: 0.3.0
AX.25: bpqether driver version 004
PPP generic driver version 2.4.2
BUG: unable to handle page fault for address: ffffdc0000000006
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 12026067 P4D 12026067 PUD 0 
Oops: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.0.0-rc1-syzkaller-00017-g3cc40a443a04 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
RIP: 0010:kernfs_root fs/kernfs/kernfs-internal.h:66 [inline]
RIP: 0010:kernfs_new_node+0x3e/0x160 fs/kernfs/dir.c:655
Code: 89 44 24 04 41 89 cc 41 89 d7 49 89 f5 48 89 fb 48 bd 00 00 00 00 00 fc ff df e8 1d 26 75 ff 48 8d 7b 30 48 89 f8 48 c1 e8 03 <80> 3c 28 00 74 05 e8 c7 c4 c8 ff 4c 8b 73 30 4d 85 f6 4c 0f 44 f3
RSP: 0000:ffffc90000067a48 EFLAGS: 00010a06
RAX: 1fffe00000000006 RBX: ffff000000000000 RCX: ffff888012228000
RDX: 0000000000000000 RSI: ffffffff8b23d2c0 RDI: ffff000000000030
RBP: dffffc0000000000 R08: 0000000000000000 R09: 0000000000000004
R10: fffffbfff19cdabd R11: 1ffffffff19cdabc R12: 0000000000000000
R13: ffffffff8b23d2c0 R14: ffff888147423e80 R15: 000000000000a1ff
FS:  0000000000000000(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffdc0000000006 CR3: 000000000ca8e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 kernfs_create_link+0x9f/0x1f0 fs/kernfs/symlink.c:39
 sysfs_do_create_link_sd+0x85/0x100 fs/sysfs/symlink.c:44
 device_add_class_symlinks drivers/base/core.c:3239 [inline]
 device_add+0x642/0xf90 drivers/base/core.c:3465
 device_create_groups_vargs drivers/base/core.c:4194 [inline]
 device_create+0x252/0x2e0 drivers/base/core.c:4236
 ppp_init+0xfb/0x157 drivers/net/ppp/ppp_generic.c:1410
 do_one_initcall+0xbd/0x2b0 init/main.c:1296
 do_initcall_level+0x168/0x218 init/main.c:1369
 do_initcalls+0x4b/0x8c init/main.c:1385
 kernel_init_freeable+0x43a/0x5c3 init/main.c:1611
 kernel_init+0x19/0x2b0 init/main.c:1500
 ret_from_fork+0x1f/0x30
 </TASK>
Modules linked in:
CR2: ffffdc0000000006
---[ end trace 0000000000000000 ]---
RIP: 0010:kernfs_root fs/kernfs/kernfs-internal.h:66 [inline]
RIP: 0010:kernfs_new_node+0x3e/0x160 fs/kernfs/dir.c:655
Code: 89 44 24 04 41 89 cc 41 89 d7 49 89 f5 48 89 fb 48 bd 00 00 00 00 00 fc ff df e8 1d 26 75 ff 48 8d 7b 30 48 89 f8 48 c1 e8 03 <80> 3c 28 00 74 05 e8 c7 c4 c8 ff 4c 8b 73 30 4d 85 f6 4c 0f 44 f3
RSP: 0000:ffffc90000067a48 EFLAGS: 00010a06
RAX: 1fffe00000000006 RBX: ffff000000000000 RCX: ffff888012228000
RDX: 0000000000000000 RSI: ffffffff8b23d2c0 RDI: ffff000000000030
RBP: dffffc0000000000 R08: 0000000000000000 R09: 0000000000000004
R10: fffffbfff19cdabd R11: 1ffffffff19cdabc R12: 0000000000000000
R13: ffffffff8b23d2c0 R14: ffff888147423e80 R15: 000000000000a1ff
FS:  0000000000000000(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffdc0000000006 CR3: 000000000ca8e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	89 44 24 04          	mov    %eax,0x4(%rsp)
   4:	41 89 cc             	mov    %ecx,%r12d
   7:	41 89 d7             	mov    %edx,%r15d
   a:	49 89 f5             	mov    %rsi,%r13
   d:	48 89 fb             	mov    %rdi,%rbx
  10:	48 bd 00 00 00 00 00 	movabs $0xdffffc0000000000,%rbp
  17:	fc ff df
  1a:	e8 1d 26 75 ff       	callq  0xff75263c
  1f:	48 8d 7b 30          	lea    0x30(%rbx),%rdi
  23:	48 89 f8             	mov    %rdi,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1) <-- trapping instruction
  2e:	74 05                	je     0x35
  30:	e8 c7 c4 c8 ff       	callq  0xffc8c4fc
  35:	4c 8b 73 30          	mov    0x30(%rbx),%r14
  39:	4d 85 f6             	test   %r14,%r14
  3c:	4c 0f 44 f3          	cmove  %rbx,%r14


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
