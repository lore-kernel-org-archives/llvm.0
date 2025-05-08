Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9DC27E1D0;
	Thu,  8 May 2025 18:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746727230; cv=none; b=Ndg01qai3F1/g5YcFtmrYZkxVqbpKN/jqi3zzJhedDCmnsL6958rsrhsTUKAC0Py1Ii4MdYFYbLrt3pxP8lkj25vmvF1sbFcDs4VBorhM2deYUqEXAscKD1IlpNy4tCe9tToNIvu9yaybubn2SC1UZDsK1qKeosv8gGZ8uejGBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746727230; c=relaxed/simple;
	bh=2OWGWC+dP0dKojtoPDjkn+UmT2pXXCdVjZjDutcVEEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HIavvwSvS1nEilAerVCHd6v9yS6r0muzP+iUz6XZgpVw4UDWJAIaD4miRr8pA1zGkcQO17DbF/YQGTE9XZib402iCFW/EqNTWQBo5iGA0yKSZgxZjvuOAgOiqVd41QMn+kxFl/vPiVad4nlFLP/7ow5wft3ObS9FSwKoM8iLWrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaGZuEY8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaGZuEY8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf680d351so13847115e9.0;
        Thu, 08 May 2025 11:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746727227; x=1747332027; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8OzbUVZza1sG9/bcAYaixiPxApsdaZfuysNbzaB9K0=;
        b=KaGZuEY8KWVXxfh5P5Fvzl7mE4sIf3FmF7vv1dgxEQrAsZ/DoBDDXToLem/fxRgoJ2
         71hV2Txwtbe2t6n8CXf506NJUQPz0oc10AXeeRyPTLF9IZrffEx24HdFKA7rk84WS7DC
         mKsW/atdIDYWMXx5VjQdbm0SRc+UGyVYYZFe5u/nesNTP2KUV5O6sd5Usqo5YghEFH+x
         xW1Cs46Dtj4Az8IT7a5j0ppVN1kPCkII1sfhKeu9SBN3Ppy6ZHrv5Jkq99UTGbOrYGPB
         QNujfRU3wbnm8vW+3MlThjK5we3/9bKTN8hw/fC5/4P68i+Gfs0x61BkG7cKbiduMzW2
         zf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746727227; x=1747332027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8OzbUVZza1sG9/bcAYaixiPxApsdaZfuysNbzaB9K0=;
        b=HZvkygEZvvrBBYv2DSxZFKfkgLC2fjBO+Z9Dlq6Er7U4e+7R1kdyy5omjz8Sy/RTob
         PESaqElSdtwto+3VvIlNPv4hdgXc52ImuGKhHrDD96+iDyc22H74vc23dMX7sAaPddIB
         oHFJRzq7JvV8vWoqMV0hwSymYKiWJ5jyqTfLnOHSfGXw5Qf9Gzaa2dA2CNckuuJBep4A
         CsFbcBTp2t+YfUyF9U5HLfyhq5zjuB3sMNNEUxY8YEmgOukngAf0UaZzDPbfc+OXqScj
         c9Ol2o4KVNSeJlz1jDYevYp7oPRAVecuJyMDDGHk8/2fXV7txoeJqBDG66pP97k7wNmz
         hteQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIGM8AzZ4W7UMJ+CJAstDS/oQDnLL1IB3W1FWxRRC4ss00V8G2RsHFa4DB5PpSL5XOokwe@lists.linux.dev, AJvYcCXkxkgy9KeZ26jBhdosniGawHSiRHyi6win0U44l+4ZpOx+eVBhDswkiTC/PgLEnQ4swq81/GXa5G6zMc78rw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxA7v+ejmcyr48mkY61gG/2VnDBANGZ5+ho4z1eywwTXs5fOgea
	1kT4kp0syf78yy0bSgHTCa6u1kLcKe15CQPclnc/oEsk/Hx8QwpL1SYFvIj8gg23nGmjaZaGKHF
	vt6wexkXMncaGtCIc/gknluR5XEg=
X-Gm-Gg: ASbGncsNtaiHAicihprjPoru7X7QSJPLzSsl/k4vgw2QHK0SclXSoApHczt89coealV
	Jk4cJihipRyqedEUoGCc+dNKxzICAO/Abyo8VZ1z5zyx138Obtupem7V7xLqp+UZZTcLMEBGi0P
	itj+ZrdsHjh8najhNmP3AW4Zpz40TcLAJOCg/QKQ==
X-Google-Smtp-Source: AGHT+IEutKBReXc/JF0L32VsIMrtixijgJVzJAL0lR8pjAQZNt/yCBZuqbqZ6pmFsmAhXU/Aot3H54T+8SiQBmMlyjU=
X-Received: by 2002:a05:6000:144f:b0:39c:30f7:b6ad with SMTP id
 ffacd0b85a97d-3a1f6c984a1mr218850f8f.18.1746727226602; Thu, 08 May 2025
 11:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000adb08b061413919e@google.com> <681c597f.050a0220.a19a9.00bd.GAE@google.com>
In-Reply-To: <681c597f.050a0220.a19a9.00bd.GAE@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 8 May 2025 11:00:15 -0700
X-Gm-Features: ATxdqUG6Mkg4Ho6RZmO8HnmSlk8KmcFHKHxysJft20HZr0IOkm_SdwFkRH0L4Ws
Message-ID: <CAADnVQ+cu2yt8v=8KE32Kymw_c-KLFUmbxZMxxjqBksafyNHiA@mail.gmail.com>
Subject: Re: [syzbot] [bpf?] possible deadlock in trie_delete_elem
To: syzbot <syzbot+9d95beb2a3c260622518@syzkaller.appspotmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard <eddyz87@gmail.com>, elic@nvidia.com, 
	Hao Luo <haoluo@google.com>, Hillf Danton <hdanton@sina.com>, Jason Wang <jasowang@redhat.com>, 
	John Fastabend <john.fastabend@gmail.com>, Jiri Olsa <jolsa@kernel.org>, 
	Martin KaFai Lau <kafai@fb.com>, KP Singh <kpsingh@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, kbuild test robot <lkp@intel.com>, 
	clang-built-linux <llvm@lists.linux.dev>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, michal.kukowski@infogain.com, 
	Michal Switala <michal.switala@infogain.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Network Development <netdev@vger.kernel.org>, norbert.kaminski@igglobal.com, 
	norbert.kaminski@infogain.com, norkam41@gmail.com, 
	oe-kbuild-all@lists.linux.dev, parav@nvidia.com, 
	Steven Rostedt <rostedt@goodmis.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Stanislav Fomichev <sdf@google.com>, Song Liu <song@kernel.org>, Song Liu <songliubraving@fb.com>, 
	syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
	=?UTF-8?Q?Wojciech_G=C5=82adysz?= <wojciech.gladysz@infogain.com>, 
	Yonghong Song <yhs@fb.com>, Yonghong Song <yonghong.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 12:13=E2=80=AFAM syzbot
<syzbot+9d95beb2a3c260622518@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 47979314c0fe245ed54306e2f91b3f819c7c0f9f
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Date:   Sun Mar 16 04:05:37 2025 +0000
>
>     bpf: Convert lpm_trie.c to rqspinlock
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D140598f458=
0000
> start commit:   c2933b2befe2 Merge tag 'net-6.14-rc1' of git://git.kernel=
...
> git tree:       net-next
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dd033b14aeef39=
158
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D9d95beb2a3c2606=
22518
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D108e1724580=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D177035f858000=
0
>
> If the result looks correct, please mark the issue as fixed by replying w=
ith:

yes.

#syz fix: bpf: Convert lpm_trie.c to rqspinlock
