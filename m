Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BE53AEF28
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568287; cv=none; b=DP33WHDNQ33T052wXtsqOINnlVy/RdKChk5m2dJ8lhRLE9bMAs2UkGB1DZH2LGNrtT2OeBYCwASoW1LStsOjWDAeC4S75hmVnoValDaRbuj53RGnpnXAKwl//C8qjt+4LzBmPa4X7TydMtnQ56CtjBgwPJm6EghVru65Smw5144=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568287; c=relaxed/simple;
	bh=lFVUic2iSQ4OXuyGGvF2a4ZliviAlyWvaKF/K+za15U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqpGIiZDhAIqIyXY2sXHAvefokIFntq3RIilVcilsfakdWlqZ7N1wLiiFvW8z5iUnHzURo/S+O7grpGHH6XZeAOSBqI1vhPPmLypspXCFQjIKNOFiypSLvHnnvA6oyyuANd03ft6JTqsrHWAgWhf4loNciy0RLNvfmwk2peMGjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHgkYDmB; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHgkYDmB"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910c3d02aso33819685a.1
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 07:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789568284; x=1790173084; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlFUKUT2IfapdBX0ngXWnLICIsdlboN0BkEZmE+ZMG4=;
        b=bHgkYDmBG9jkM+Le3U7vk/uhhSd5J0il9D3ljHchF76K3Qwb7o93gNiuHnmXpV+Nl9
         /NQ1iJA4HRQdtrR0MCx2tBrMnI3l1r3ImmvxDPbGnnx/zpf9cJLq+f9M7eD5AjxogpHB
         /e+cw4yZue70m8yuBcMP2lTk16nob+LgDt2EPIchxt9scebrOYF/2oGWYXLAdBspYA/U
         dRArdwesoyv00q5R6D5pIOfzA3CRotlT4Jps6HAlgKbCrnBZXWTt7wMV+fheVtII5iXc
         nktiYqSfNasNOoBxqvMvLJq860q+EFEeWnk/yNMnpWs/SrO6+PupgBMvJSA5PYXRAqtb
         Y34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789568284; x=1790173084;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VlFUKUT2IfapdBX0ngXWnLICIsdlboN0BkEZmE+ZMG4=;
        b=ipnEV7n8MPmB0+ck/sHIUalAqQJOO1LLm515Z+9q/23PJ0lp6kTIgU7CMZ0nLGgp+1
         eoobrZIqBhoNAd7QvzXpKTTKelCuOvl/13QzSkMUCis+nXyjGJ+23ObYgfyTvsQo5ihw
         jdwy0sbBn5EYF+GTDmax5+RopfAtJq79+BaD4UBpktYimmgz8QiY5G6Tpfqp5BczTohe
         IIL5zoXIP3uIem29HTb4IjeVR1yqRi1IQubRp0YHJipv5JmeWFEHpdyAzAp189y6KKYo
         JPMdtjpbQMvue24Gb0v3+Lcyl3VEVaifZho5dQQbd/eixVe32o7U+QyunOwEzxNBfZ2n
         uUkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgYV0TcH/WhyrIlahUGurKeZW4cqZFK5R0WHxo/kI4CclkxbCxc20gzNdkfbcr0HN1dtXz@lists.linux.dev
X-Gm-Message-State: AFuF++n1ZiRWRC9OWtklvO+1ERuYD5Pq0zYptcWazeLOMORBJakgJrwz
	rG10m1OWEBcYBBolCsc3FRRWqWtoZjxP2p1TqGoOWtv9vaUpE9a1INCs
X-Gm-Gg: AYBFou0RHYzbHYsGJB+P5RxkNqDlUgHwsukz8mTt/O/v2Iev9YbYuYay51tF+7nq1sh
	j+IXCCTxNjmA1AAYlF5QGh1TwlGPrjyTaWephVJeH9VdDOIEmdTnIZts0xLWnIFeKzD+Muizuug
	8JBAuigJ84Ls8iRDRuqqpoNNDUZq9cmRUKcZ1CjSQCh8YmnDLyPLtIzCbx2fNXBE7SZbULF4Jkh
	gbd/t64odOB0kySaQ2H3oO/6BbxjcTgLa/QF1n1QnzjNJFwb0GVqzMWpvwE/KG0cBXXJsfGxDr4
	0kbJq3D7NhLH2PuutNOxaurjuzwhEW1s+cBak+yNMnax2yHzKgD7c0k4Vxr86o9HRlpolUuFF0i
	7crxgF8FCZ4q3m7G2WeaqLs9vf/984YD21b9Gt6lhkN7HoKUOvj8PKjmHBmtTmiCMaLKUlUo7lC
	/IKQ+FVB7P2K9b5tDWpbf2vy6qC/U34+f+cO5GiSTcoqIHg+pMeSSm+5z3mkAZFdwRqx8ehZKqH
	Yav8e0Ev5Ikth3/QqUetbV+qSJyZe+yJkZzbyYvLSfH7w==
X-Received: by 2002:a05:620a:318c:b0:939:83c1:d8c6 with SMTP id af79cd13be357-93bb71b6f5cmr340423285a.8.1789568284122;
        Wed, 16 Sep 2026 07:18:04 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b81d19df1sm228561685a.45.2026.09.16.07.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:18:03 -0700 (PDT)
Date: Wed, 16 Sep 2026 19:47:47 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, ynorov@nvidia.com, david@davidgow.net, 
	joelagnelf@nvidia.com, fujita.tomonori@gmail.com, linkmauve@linkmauve.fr, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH V5 2/2] rust: kernel: Add KUnit tests for powerpc
 ARCH_WARN_ASM bug table emission
Message-ID: <aqqk-YRcGcUsqOiI@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260915090453.1227034-1-mkchauras@gmail.com>
 <20260915090453.1227034-3-mkchauras@gmail.com>
 <20260916.230658.2266384286281034372.tomo@flapping.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916.230658.2266384286281034372.tomo@flapping.org>

On Wed, Sep 16, 2026 at 11:06:58PM +0900, FUJITA Tomonori wrote:
> On Tue, 15 Sep 2026 14:34:53 +0530
> "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com> wrote:
> 
> > Verify that the __bug_table entry emitted by ARCH_WARN_ASM has a correct
> > bug_addr displacement ― i.e. the '1b' label reference in _EMIT_BUG_ENTRY
> > resolves to the trap instruction ― by calling find_bug() with the exact
> > virtual address of the twi instruction, mirroring what the real powerpc
> > trap handler does.
> > 
> > The trap address is captured at link time via a .dc.a 1b relocation placed
> > in .data by the global_asm! block. global_asm! is used instead of asm!
> > because LLVM eliminates asm! blocks in dead branches; global_asm! is
> > file-scope and always emitted. BUG_KUNIT_TRAP_ADDR is defined as a .global
> > symbol directly on the .dc.a word so the linker relocation lands on it ―
> > a Rust static initialized to zero would end up in BSS where relocations are
> > not applied.
> > 
> > .dc.a emits a pointer-width word (4 bytes on ppc32, 8 bytes on ppc64),
> > so BUG_KUNIT_TRAP_ADDR is declared as usize on the Rust side, making the
> > tests correct on both ppc32 and ppc64. The global_asm! block is split into
> > two cfg-gated variants (CONFIG_PPC64 / !CONFIG_PPC64) to select the right
> > .balign since concat!() only accepts literals.
> > 
> > Five tests are included in the rust_kernel_bug_powerpc suite:
> > 
> >   bug_entry_found         - find_bug() returns non-NULL for the trap address,
> >                             proving the bug_addr displacement is correct
> >   bug_entry_is_warning    - the emitted entry has BUGFLAG_WARNING set
> >   bug_entry_file          - bug_get_file_line() returns the correct source
> >                             file (requires CONFIG_DEBUG_BUGVERBOSE)
> >   bug_entry_line          - the recorded line number is non-zero, confirming
> >                             the {line} operand was substituted correctly
> >                             (requires CONFIG_DEBUG_BUGVERBOSE)
> >   bug_entry_addr_is_in_text - kernel_text_address() confirms the trap address
> >                             lies in kernel text, not data or zero
> > 
> > The suite is named rust_kernel_bug_powerpc and the Kconfig option
> > CONFIG_RUST_BUG_POWERPC_KUNIT_TEST depends on PPC && GENERIC_BUG,
> > covering both ppc32 and ppc64.
> > 
> > Tested on ppc64le (ltcfujiaac-lp3, 7.3.0-rc1+): pass:5 fail:0 skip:0.
> > Tested on ppc32 Book3S (QEMU mac99 G4, chrp32_defconfig): pass:5 fail:0 skip:0.
> > Tested on ppc64le (QEMU pseries, pseries_le_defconfig): pass:5 fail:0 skip:0.
> > 
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> >  rust/kernel/Kconfig.test |  13 +++
> >  rust/kernel/bug.rs       | 209 +++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 222 insertions(+)
> 
> I think that testing warn_on!, in particular that the right address is
> put in the bug entry, is a good idea.
> 
> I'd prefer such a test to work on every architecture. This one depends on
> details of powerpc's ARCH_WARN_ASM, such as the '1b' label. KUnit has a
> warning suppression API. A test can call warn_on! inside a suppression
> block and check that one warning was counted. The counter is only
> incremented after find_bug() found the entry, so a wrong address is caught
> too.
> 
> I'll send a patch for that shortly.

yeah,

makes sense.

Regards,
Mukesh
