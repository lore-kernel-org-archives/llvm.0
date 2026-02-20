Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D6D353ECA
	for <llvm@lists.linux.dev>; Fri, 20 Feb 2026 17:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771608548; cv=none; b=Z3KI1EX05TRUzh4vBX3mLUqrpCc+WFyAeCM6O+B3PTo+Mg+j0toUHrWrnIMMlP0MLXmpRG91dELjMZQRtjAhGVQSS40llze1lU9w8m3RWq8hTX48KfI03mTFg5vhxtze/4ivOVorCsUHpAiC0PFMDjdeBNyAwSgR5x2amAByKlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771608548; c=relaxed/simple;
	bh=9Cyby1P7/giVIIERMRfZ7Dh2BAfpxfst6Jgj546evcU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=AgBvttiwrLDFMONeWYGjp5h6s9LsQSyqEZ7jTjy6h7aP41MAI61o0CneQ/GqkPzOlYB5ZoziYxIlkoL1arQ167dEQjfZ/O7Q24Yaycf0mkSJx6BFc6wJTHSl6lvzn7PtvVBICrC02bOxruBvcfPiKERzPx6S0UrmmTVUiTZGOsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=V14mXAto; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="V14mXAto"
Received: from smtpclient.apple (c-24-130-165-117.hsd1.ca.comcast.net [24.130.165.117])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 61KHCZiE2496145
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 20 Feb 2026 09:12:36 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 61KHCZiE2496145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026012301; t=1771607557;
	bh=z/HgO+bmDFlpHZlNXeji0TYgAT5VYkUBW8MaAeZESUQ=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=V14mXAtohX7ceGG36AKl4JvXUYSVb39PVaPFLBuYjPss/LXzYN4cTlCQZ1780OKkH
	 +uqnqUH5X55kvRhY9FZtdgMyRyOsa5UdrWbyB/DqjsFTA0fCRG5TwDCtj6XqPygzWj
	 5hpN0j5r3ce9XFxS7gtX5Ypyu9LdhIHVzk8rzvgt/596YcXOD6e2vjdAJhcXsaHJas
	 txyfwnAyquwdP0FNhM3G7uZSYQI9rQu6s+ZZn4oY1VpT1iPneK+4x1TGJqludhL4Fq
	 AMuoZbEGMWkyBtke8LNdys60MVT+FmnaOHG0xhzxn+sd+PJWoCIy9RGn71h15Nw53N
	 Fmxi6+8XgCoVQ==
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.21\))
Subject: Re: [PATCH v3 09/16] x86/msr: Use the alternatives mechanism for
 WRMSR
From: Xin Li <xin@zytor.com>
In-Reply-To: <d622a318-f7f8-4cff-b540-38d159ca87f4@suse.com>
Date: Fri, 20 Feb 2026 09:12:16 -0800
Cc: Dave Hansen <dave.hansen@intel.com>,
        Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org, kvm@vger.kernel.org, llvm@lists.linux.dev,
        "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <437EC937-24B7-4E69-B369-F9FAFC46F1B1@zytor.com>
References: <20260218082133.400602-1-jgross@suse.com>
 <20260218082133.400602-10-jgross@suse.com> <aZYoUE7CmrLg3SVe@google.com>
 <e05a65a7-bf8e-420b-8a36-2d76e56b43b0@intel.com>
 <d622a318-f7f8-4cff-b540-38d159ca87f4@suse.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
X-Mailer: Apple Mail (2.3864.400.21)


> On Feb 18, 2026, at 10:44=E2=80=AFPM, J=C3=BCrgen Gro=C3=9F =
<jgross@suse.com> wrote:
>=20
> On 18.02.26 22:37, Dave Hansen wrote:
>> On 2/18/26 13:00, Sean Christopherson wrote:
>>> On Wed, Feb 18, 2026, Juergen Gross wrote:
>>>> When available use one of the non-serializing WRMSR variants =
(WRMSRNS
>>>> with or without an immediate operand specifying the MSR register) =
in
>>>> __wrmsrq().
>>> Silently using a non-serializing version (or not) seems dangerous =
(not for KVM,
>>> but for the kernel at-large), unless the rule is going to be that =
MSR writes need
>>> to be treated as non-serializing by default.
>> Yeah, there's no way we can do this in general. It'll work for 99% of
>> the MSRs on 99% of the systems for a long time. Then the one new =
system
>> with WRMSRNS is going to have one hell of a heisenbug that'll take =
years
>> off some poor schmuck's life.
>=20
> I _really_ thought this was discussed upfront by Xin before he sent =
out his
> first version of the series.

I actually reached out to the Intel architects about this before I =
started
coding. Turns out, if the CPU supports WRMSRNS, you can use it across =
the
board.  The hardware is smart enough to perform a serialized write =
whenever
a non-serialized one isn't proper, so there=E2=80=99s no risk.

