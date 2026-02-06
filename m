Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836643A7F7C
	for <llvm@lists.linux.dev>; Fri,  6 Feb 2026 12:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770380664; cv=none; b=tHn3jo8dMGJdLBF44g73gVDBaPE/FN0YKdtMxcghHA7l4Q8DuHdYwdtm5LgSngXHy9/PGMaZogV/1nzofShlgLsuTGr5dghlP+cnSbWzzhDP2+LM760BY1CzWBI5g6txaOwgdf4HTcsECqKXiWy0NvpoIHxAt79aTI1jrmOAq00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770380664; c=relaxed/simple;
	bh=xihRajkhxSN0LzS6oaE2l+KPnSf/jZpWp5DiMy2CGUs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f16U2xer+mh0lTTCSgwUlWZ4z63hhWA/sbvs//998y/Ab1R2mremnEWBrryl+OE8/xaGe+OAYDuvti/JDLK0qQNHCgVDeUsLO33dSp+5lB3V8Ufy+sOeO/h9XM1bs04Py2l17QzKY8780G2KkVCa4TtGPL28HuaTH4KIgFVz8CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=NmHEMIco; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="NmHEMIco"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 8D8B8240029
	for <llvm@lists.linux.dev>; Fri,  6 Feb 2026 13:24:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1770380656; bh=U+Pf4h9M3YEQg0wRE4TDVLhds2dAi1ljJ/3l0LMHbzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=NmHEMIcoerHjzuD4tJMyvxsXu9zwDiXUTVm/LEGhC8+I9Ssm8IEcX3p/fpIQqzDhI
	 +hGqZvk61EpnBPX45I4KE0MQAENUK3bA1RmGtJLEtlekWDwWOqyERmJlHDFIaRY2DS
	 Lccl46s+Tc1RjhTQayH+mTu39OlRxE2bdHlqE/Gjjjm/6J3o8xEjxZzqD+nhGBxGdh
	 D9MBSNchx+HlNaM4jNlh3H3dQRolnzWG9e/IjZypcEAJK911ajBH/QSF0EJKENjDVh
	 5EBI3kinb27Nmh9rgH13fXL2Q539V0/vxhKn7V/cfMwYj65vHOUctzBW7YVjY6u2Dk
	 mPbITL76tJr7g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4f6tYh12xGz9rxF;
	Fri,  6 Feb 2026 13:24:08 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
Cc: Nathan Chancellor <nathan@kernel.org>,  Nicolas Schier <nsc@kernel.org>,
  Miguel Ojeda <ojeda@kernel.org>,  Boqun Feng <boqun.feng@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Benno Lossin <lossin@kernel.org>,  Andreas Hindborg
 <a.hindborg@kernel.org>,  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross
 <tmgross@umich.edu>,  Danilo Krummrich <dakr@kernel.org>,  Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>,  Bill Wendling
 <morbo@google.com>,  Justin Stitt <justinstitt@google.com>,  Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Jonathan
 Corbet <corbet@lwn.net>,  Conor Dooley <conor@kernel.org>,  Mingcong Bai
 <jeffbai@aosc.io>,  Han Gao <rabenda.cn@gmail.com>,  Vivian Wang
 <wangruikang@iscas.ac.cn>,  Jason Montleon <jmontleo@redhat.com>,
  linux-kbuild@vger.kernel.org,  linux-kernel@vger.kernel.org,
  rust-for-linux@vger.kernel.org,  llvm@lists.linux.dev,
  linux-riscv@lists.infradead.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 4/4] RISC-V: handle extension configs for bindgen,
 re-enable gcc + rust builds
In-Reply-To: <9323714a-b15f-4616-a525-780accf33b52@isrc.iscas.ac.cn>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
	<20251230-gcc-rust-v5-v6-4-2ac86ba728c8@isrc.iscas.ac.cn>
	<87v7gk8r5x.fsf@posteo.net>
	<9323714a-b15f-4616-a525-780accf33b52@isrc.iscas.ac.cn>
Date: Fri, 06 Feb 2026 12:24:15 +0000
Message-ID: <874inucb6g.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn> writes:

> On 1/29/26 21:49, Charalampos Mitrodimas wrote:
>
>> I'm under the impression that the `!RUST ||` guard here doesn't
>> actually prevent the `$(bindgen-backend-option,...)` call from being
>> executed. `$(...)` shell expansions should happen during the textual
>> substitution phase, before symbol dependency evaluation occurs, check
>> documentation at kconfig-macro-language.rst lines 228-229.
>
> I suppose this is unavoidable if we decide to probe options rather
> than rely on version numbers.
>
> Similar issue also occurs in `cc-option`, for example:
>
> 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64imv)
> 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)
>
> For 64-bit builds, `-march=rv32imv` will still be probed; for 32-bit
> builds, `-march=rv64imv` will still be probed.
>
> I agree with Nathan that this trivial waste is worth it for the sake
> of simplicity.

Understood. Seems not worth it at all.

>
> Best regards,
> Asuna
