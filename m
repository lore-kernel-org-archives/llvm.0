Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650A71DFE0
	for <llvm@lists.linux.dev>; Tue, 31 Oct 2023 18:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=shelob.surriel.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from imladris.home.surriel.com ([10.0.13.28] helo=imladris.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <riel@shelob.surriel.com>)
	id 1qxtdf-0003Nw-1c;
	Tue, 31 Oct 2023 14:38:55 -0400
Message-ID: <bce5df0508221ab30a1fb121a219034631abedf5.camel@surriel.com>
Subject: Re: [syzbot] [mm?] general protection fault in
 hugetlb_vma_lock_write
From: Rik van Riel <riel@surriel.com>
To: syzbot <syzbot+6ada951e7c0f7bc8a71e@syzkaller.appspotmail.com>, 
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,  llvm@lists.linux.dev, mike.kravetz@oracle.com,
 muchun.song@linux.dev,  nathan@kernel.org, ndesaulniers@google.com,
 syzkaller-bugs@googlegroups.com,  trix@redhat.com
Date: Tue, 31 Oct 2023 14:38:55 -0400
In-Reply-To: <00000000000078d1e00608d7878b@google.com>
References: <00000000000078d1e00608d7878b@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Sender: riel@surriel.com

On Sun, 2023-10-29 at 02:27 -0700, syzbot wrote:
>=20
> commit bf4916922c60f43efaa329744b3eef539aa6a2b2
> Author: Rik van Riel <riel@surriel.com>
> Date:=C2=A0=C2=A0 Fri Oct 6 03:59:07 2023 +0000
>=20
> =C2=A0=C2=A0=C2=A0 hugetlbfs: extend hugetlb_vma_lock to private VMAs
>=20

I've been trying to reproduce the issue here, but the test
case has been running for 4+ hours now on a KVM guest, with
KASAN and CONFIG_PROVE_LOCKING enabled. No crashes yet.

I'll try adapting the config file from syzkaller so the
resulting kernel boots here, but this is not looking like
an easy reproducer so far...

The crash is also confusing me somewhat, because it looks
like hugetlb_vma_lock_write() is passing a nonsense (very small
value) resv_map->rw_sema pointer down to down_write, but the
code has some protection against that:

static inline bool __vma_private_lock(struct vm_area_struct *vma)
{              =20
        return (!(vma->vm_flags & VM_MAYSHARE)) && vma-
>vm_private_data;
}   =20

void hugetlb_vma_lock_write(struct vm_area_struct *vma)
{
        if (__vma_shareable_lock(vma)) {
                struct hugetlb_vma_lock *vma_lock =3D vma-
>vm_private_data;
               =20
                down_write(&vma_lock->rw_sema);
        } else if (__vma_private_lock(vma)) {
                struct resv_map *resv_map =3D vma_resv_map(vma);
        =20
                down_write(&resv_map->rw_sema);
        }              =20
}

At fork time, vma->vm_private_data gets cleared in the child
process for MAP_PRIVATE hugetlb VMAs.

I do not see anything that would leave behind a tiny, but
non-zero value in that pointer.

I'll keep poking at this, but I don't know if it will
reproduce here.

> general protection fault, probably for non-canonical address
> 0xdffffc000000001d: 0000 [#1] PREEMPT SMP KASAN
> KASAN: null-ptr-deref in range [0x00000000000000e8-
> 0x00000000000000ef]
> CPU: 0 PID: 5048 Comm: syz-executor139 Not tainted 6.6.0-rc7-
> syzkaller-00142-g888cf78c29e2 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine,
> BIOS Google 10/09/2023
> RIP: 0010:__lock_acquire+0x109/0x5de0 kernel/locking/lockdep.c:5004
> Code: 45 85 c9 0f 84 cc 0e 00 00 44 8b 05 c1 1e 42 0b 45 85 c0 0f 84
> be 0d 00 00 48 ba 00 00 00 00 00 fc ff df 4c 89 d1 48 c1 e9 03 <80>
> 3c 11 00 0f 85 e8 40 00 00 49 81 3a a0 d9 5f 90 0f 84 96 0d 00
> RSP: 0018:ffffc90003aa7798 EFLAGS: 00010016
>=20
> RAX: ffff88807a0b9dc0 RBX: 1ffff92000754f23 RCX: 000000000000001d
> RDX: dffffc0000000000 RSI: 0000000000000000 RDI: 00000000000000e8
> RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
> R10: 00000000000000e8 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> FS:=C2=A0 0000000000000000(0000) GS:ffff8880b9800000(0000)
> knlGS:0000000000000000
> CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000020000280 CR3: 00000000758bf000 CR4: 0000000000350ef0
> Call Trace:
> =C2=A0<TASK>
> =C2=A0lock_acquire kernel/locking/lockdep.c:5753 [inline]
> =C2=A0lock_acquire+0x1ae/0x510 kernel/locking/lockdep.c:5718
> =C2=A0down_write+0x93/0x200 kernel/locking/rwsem.c:1573
> =C2=A0hugetlb_vma_lock_write mm/hugetlb.c:300 [inline]
> =C2=A0hugetlb_vma_lock_write+0xae/0x100 mm/hugetlb.c:291
> =C2=A0__hugetlb_zap_begin+0x1e9/0x2b0 mm/hugetlb.c:5447
> =C2=A0hugetlb_zap_begin include/linux/hugetlb.h:258 [inline]
> =C2=A0unmap_vmas+0x2f4/0x470 mm/memory.c:1733
> =C2=A0exit_mmap+0x1ad/0xa60 mm/mmap.c:3230
> =C2=A0__mmput+0x12a/0x4d0 kernel/fork.c:1349
> =C2=A0mmput+0x62/0x70 kernel/fork.c:1371
> =C2=A0exit_mm kernel/exit.c:567 [inline]
> =C2=A0do_exit+0x9ad/0x2a20 kernel/exit.c:861
> =C2=A0__do_sys_exit kernel/exit.c:991 [inline]
> =C2=A0__se_sys_exit kernel/exit.c:989 [inline]
> =C2=A0__x64_sys_exit+0x42/0x50 kernel/exit.c:989
> =C2=A0do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> =C2=A0do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
> =C2=A0entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7ff2b7a78ab9
> Code: Unable to access opcode bytes at 0x7ff2b7a78a8f.
> RSP: 002b:00007fff926ea6b8 EFLAGS: 00000246 ORIG_RAX:
> 000000000000003c
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007ff2b7a78ab9
> RDX: 00007ff2b7ab23f3 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 000000000000cfda R08: 0000000000000000 R09: 0000000000000006
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007fff926ea6cc
> R13: 431bde82d7b634db R14: 0000000000000001 R15: 0000000000000001
> =C2=A0</TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:__lock_acquire+0x109/0x5de0 kernel/locking/lockdep.c:5004
> Code: 45 85 c9 0f 84 cc 0e 00 00 44 8b 05 c1 1e 42 0b 45 85 c0 0f 84
> be 0d 00 00 48 ba 00 00 00 00 00 fc ff df 4c 89 d1 48 c1 e9 03 <80>
> 3c 11 00 0f 85 e8 40 00 00 49 81 3a a0 d9 5f 90 0f 84 96 0d 00
> RSP: 0018:ffffc90003aa7798 EFLAGS: 00010016
> RAX: ffff88807a0b9dc0 RBX: 1ffff92000754f23 RCX: 000000000000001d
> RDX: dffffc0000000000 RSI: 0000000000000000 RDI: 00000000000000e8
> RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
> R10: 00000000000000e8 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> FS:=C2=A0 0000000000000000(0000) GS:ffff8880b9800000(0000)
> knlGS:0000000000000000
> CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000020000280 CR3: 00000000758bf000 CR4: 0000000000350ef0
> ----------------
> Code disassembly (best guess):
> =C2=A0=C2=A0 0:=C2=A0=C2=A0=C2=A045 85 c9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0test=C2=
=A0=C2=A0 %r9d,%r9d
> =C2=A0=C2=A0 3:=C2=A0=C2=A0=C2=A00f 84 cc 0e 00 00=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0je=C2=A0=C2=A0=C2=A0=C2=A0 0xed5
> =C2=A0=C2=A0 9:=C2=A0=C2=A0=C2=A044 8b 05 c1 1e 42 0b=C2=A0=C2=A0=C2=A0=
=C2=A0mov=C2=A0=C2=A0=C2=A0 0xb421ec1(%rip),%r8d=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 #
> 0xb421ed1
> =C2=A0 10:=C2=A0=C2=A0=C2=A045 85 c0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0test=C2=A0=C2=
=A0 %r8d,%r8d
> =C2=A0 13:=C2=A0=C2=A0=C2=A00f 84 be 0d 00 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0je=C2=A0=C2=A0=C2=A0=C2=A0 0xdd7
> =C2=A0 19:=C2=A0=C2=A0=C2=A048 ba 00 00 00 00 00=C2=A0=C2=A0=C2=A0=C2=A0m=
ovabs $0xdffffc0000000000,%rdx
> =C2=A0 20:=C2=A0=C2=A0=C2=A0fc ff df
> =C2=A0 23:=C2=A0=C2=A0=C2=A04c 89 d1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mov=C2=A0=C2=A0=
=C2=A0 %r10,%rcx
> =C2=A0 26:=C2=A0=C2=A0=C2=A048 c1 e9 03=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0shr=C2=A0=C2=A0=C2=A0 $0x3,%rc=
x
> * 2a:=C2=A0=C2=A0=C2=A080 3c 11 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cmpb=C2=A0=C2=A0 $0x0,(%rcx,%rdx,1) =
<--
> trapping instruction
> =C2=A0 2e:=C2=A0=C2=A0=C2=A00f 85 e8 40 00 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0jne=C2=A0=C2=A0=C2=A0 0x411c
> =C2=A0 34:=C2=A0=C2=A0=C2=A049 81 3a a0 d9 5f 90=C2=A0=C2=A0=C2=A0=C2=A0c=
mpq=C2=A0=C2=A0 $0xffffffff905fd9a0,(%r10)
> =C2=A0 3b:=C2=A0=C2=A0=C2=A00f=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0.byte 0xf
> =C2=A0 3c:=C2=A0=C2=A0=C2=A084=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0.byte 0x84
> =C2=A0 3d:=C2=A0=C2=A0=C2=A096=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0xchg=C2=A0=C2=A0 %eax,%esi
> =C2=A0 3e:=C2=A0=C2=A0=C2=A00d=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0.byte 0xd
>=20
>=20
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ=C2=A0for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>=20
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status=C2=A0for how to communicate with syzbot.
> For information about bisection process see:
> https://goo.gl/tpsmEJ#bisection
>=20
> If the bug is already fixed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>=20
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before
> testing.
>=20
> If you want to overwrite bug's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>=20
> If the bug is a duplicate of another bug, reply with:
> #syz dup: exact-subject-of-another-report
>=20
> If you want to undo deduplication, reply with:
> #syz undup
>=20

--=20
All Rights Reversed.
