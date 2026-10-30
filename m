Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793387068;
	b=R0oPJFq+xWiy3Wj997AfPGoO06WKsxAzpeH0HWod5gt4ZX3JfhMcmwxtPSHuI4hHK34c
	 n8RrIjMnKneyVXpFfL8QhjIzD1oXyxQP+APRnvf5oRJtFQNjuRBasCPrQ48sioKq49ej3
	 LmhvIBa4ch9uvZ+hHDYHOeW13ugynbWxFi3jTCxSvuftprOiq4uX51EpuRw8UbxpO961y
	 l25U1oivGWJNGJtMTv4O+qc3aI5Caxg7AM2a1HgO/U+I+NAdSp6KVU1hLpSaF0Wy8OvCG
	 mFEDLOR8vj34tqrBOlLZWBMTuPeZqfx6FhD/wUn8RSwEm7TN38FJTF7t0368xFONOWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387068;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:CC:
	 Subject:User-Agent:In-Reply-To:References:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=5+36APwg0dWz15+pn8N5fbtSJqGPL630k5FFR0hc/4o=;
	b=dn3sv7lUxxAdUKD2my0KYSHnhDUwNGrjM6oQubLIj4kycE5rSxfar1XTJ1NnZ8QaZtSI
	 A/XioMTTjn5ERAy5/Z0PgOHoYAkEMkQqcVk0IOUqk/pDlquk+RgGJE/gdbRlhNTfaauiW
	 uNiO6FPszjwSBXiFqhNRCJcbOQfqqB1HCeeWjIOXkfo6lmdSiqZ4I9apLyaw1FIpKdTgL
	 plPdgeXK6TA/bsoKmeQoxvkSfmEVFOXJhMf6kDPlLSZ5t7QC+x0fZmwIPFJSqytkX9px1
	 CAQXwhe7EH8mSVOcYy8mZJALuGrDAbCjzJMpIBCp58H7yOmuI6ZOpnYyC02R/LmVkuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zytor.com;
	spf=pass smtp.mailfrom=zytor.com;
	dkim=pass header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=qzCeCLwf;
	arc=none smtp.remote-ip=198.137.202.136
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDCE606A31A
	for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 19:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CDCE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=qzCeCLwf
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 69UJ3Y0I4080101
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 30 Oct 2026 12:03:35 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 69UJ3Y0I4080101
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026102901; t=1793387016;
	bh=5+36APwg0dWz15+pn8N5fbtSJqGPL630k5FFR0hc/4o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=qzCeCLwfhg1QIbdFJiY5m00RvHPyPVsqKBSSkO/ZdEf5Jctg14OnFe155tBbbb7kW
	 TMY306cuYBCTnKibdeN6O52tzabZNQM0QUy1qO6yCSgSFmdHzOeLGJcKEXhpsOUOT8
	 nRKFKtoL9GdudaFrBMpcy+b8N7RMUh1dFJmcY7YgXfMB4+RncIIzmfJiD78LYozl+j
	 xJ10wBs+xH1jRKaldF2ZsP9xpbPGILLvL3EuaEsAvCmUUXohENnp+E/f+k5rZXvdML
	 FykvGQVYydL6EZ/4GEshABhNuwm2H939RTW/6d4Nex6DwsgMGEjzgUOnANZZYMzrG2
	 XNUoKdr/Az9Pw==
Date: Fri, 30 Oct 2026 12:03:28 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Breno Leitao <leitao@debian.org>
CC: Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, kernel-team@meta.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RFC=5D_x86/syscall=3A_Dispatch_via_sy?=
 =?US-ASCII?Q?s=5Fcall=5Ftable_when_Spectre_v2_and_BHI_are_off?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
References: <20261029-syscall-table-dispatch-v1-1-bca9dbb886de@debian.org> <20261029104938.GC1813469@noisy.programming.kicks-ass.net> <auM6mSXz-BVIjYBc@gmail.com> <CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
Message-ID: <FC7D30AA-5576-476E-AAD3-8471D5D350BE@zytor.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 30, 2026 11:56:12 AM PDT, Linus Torvalds <torvalds@linux-foundat=
ion=2Eorg> wrote:
>On Thu, 29 Oct 2026 at 02:30, Breno Leitao <leitao@debian=2Eorg> wrote:
>>
>> With "x86_64/entry: Unconditionally use -fno-jump-table", x64_sys_call(=
)
>> becomes a compare tree on every x86_64 build, so system call dispatch i=
s
>> the same whether the mitigations are disabled at boot or at build time,
>> which is basically my end goal=2E
>
>You're basically saying "with that patch, both cases do equally badly
>whether disabled at boot or build time"=2E
>
>That's not a good end goal=2E You want both cases to do equally *well*=2E
>
>I do wonder if we could do computed jumps=2E It would be lovely if we
>could basically do something like
>
>      # syscall number in %rax
>      leaq table(%rax,%rax,4),%rax
>      jmp *%rax
>table:
>     jmp syscall0
>     jmp syscall1
>     jmp syscall2
>    =2E=2E=2E=2E
>
>and avoid any indirect memory lookup or indirect branches (outside of
>the one computed one)=2E And no extra call/ret frame=2E
>
>It's possible that the branch prediction hardware hates those kinds of
>very dense jmp patterns, though=2E I don't know=2E
>
>We could have a single static jump that picks between this one and the
>"conditional branch tree" version, as in your patch at the beginning
>of the thread=2E
>
>             Linus

As far as I understand, with modern hardware there is very little differen=
ce between the two in practice=2E=20

The advantage of using a branch tree is that you don't end up having any *=
possibility* of out-of-range speculative accesses going off into some specu=
lative hyperspace=2E
