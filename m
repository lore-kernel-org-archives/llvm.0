Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769637;
	b=j9pjp7oFx3WojXedYhXbgFRjZmcpLtg2y7EXOf9liQhal3LtECddxJdfZPy0JYFLw69Z
	 BzrKY/RKwSCk7me2+i4HJ1Z91oevgpWk0amFCyMhx4tC397LdiY0JQmDVOkFU//8ZG8Or
	 L8cw/Rg1hNfvn8Z95Tb5ThzDaCqHvMvfU6EAgMzKH2uu82DEUr3kkZw/5H/J1W71wIBcE
	 3OVnzuTLLzs/XDc3atNHQNoaL+WkbirEudPwu95042wNLT9HPM2odFWJMsrtmv34k0zA9
	 WEeMzGMTEnneES/PfD5WN3g4X0h4A7404OLvM4QZZh7PDdYtgvHDUcwrwQbYmRaazPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7Wb1v2r/qYRtiPl0jIe1hNPHXwCTAadI+O91fZCXmrY=;
	b=Jn15oz7rLsTzbDfS7096jbugDoHBAKahbGHaCeHCCzv0GoAB+kVAtd2qb/sz0DKO35RK
	 /on5Q//CY/X7mOHT7GdY8hKKzytCyDUPvRLYJdPOv38NMRzexd3dm0bdt4lOUz6ffaiaY
	 igto4mOh2Nzesvfd425DXUhD9MTsM+jC2DJeBucl2d2IjZf1ZQXkKfLnxDFXGsMYtkYTk
	 VBgmJUlcD6MNhIJ5N7IDUX/pJoRUiSpMUPT0IMJ6t+dC/HN8xfiF3sFd+nHUkty2So0vS
	 BP2JZTCBbaWomQRiMjO54V+rZahKJV1nhimrLHXQ7pyOCMEnq7XtgF7F61aT3Ykm3VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=rCMuRByi;
	arc=none smtp.remote-ip=199.89.1.16
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E92C606A31A;
	Fri, 23 Oct 2026 15:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E92C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=rCMuRByi
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4jB6W76QDmzlfvq1;
	Fri, 23 Oct 2026 15:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1792769630; x=1795361631; bh=7Wb1v2r/qYRtiPl0jIe1hNPH
	XwCTAadI+O91fZCXmrY=; b=rCMuRByiWmhZFjeZ5qLIAzfq617H+WMca34naCk3
	+sjbZEgrMBWR+Rg+mW77Y00vOUwDFZ3llPkSwwu3j7QMahdVgK8PsPIA7qiToMLf
	k+cyGtIzD49k1z3b/4X5J+ZB1t9Om2nf3PessiURNiiEmrpIbFEGJRGjMfDWAQyq
	o4hfO4UV9XnA5aQYtlZwCBpO64jNHpP92IBp5+b8KSdUVnuQdmlMoX/wdTFzD/qL
	+jckkjiweaK9ssfqz6B7WWwoROpJ8Myx6YEnrsnqxLltQRl4rxdFPdTQz/ajAtAD
	5kHwdsIKjyHgm5Tz6FmyV0GwCQ0vaj3YB2M13viGoDLbEQ==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id qHTd1dz6LMfl; Fri, 23 Oct 2026 15:33:50 +0000 (UTC)
Received: from [192.168.51.14] (c-24-6-239-25.hsd1.ca.comcast.net [24.6.239.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4jB6W13c5Czlfvps;
	Fri, 23 Oct 2026 15:33:49 +0000 (UTC)
Message-ID: <9aa270db-bfc6-4a33-a7f1-225782e9226e@acm.org>
Date: Fri, 23 Oct 2026 08:33:48 -0700
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] include: Replace __ASSEMBLY__ with __ASSEMBLER__
 in non-uapi headers
To: Thomas Huth <thuth@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Chris Li <sparse@chrisli.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-sparse@vger.kernel.org, llvm@lists.linux.dev
References: <20261023064908.66707-1-thuth@redhat.com>
 <20261023064908.66707-13-thuth@redhat.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261023064908.66707-13-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 11:48 PM, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize now
> on the __ASSEMBLER__ macro that is provided by the compilers.
> 
> This is a completely mechanical patch (done with a simple "sed -i"
> statement).

For future patch submissions, please include the command that has been
used to modify the code in the patch description. Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
