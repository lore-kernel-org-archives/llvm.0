Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794885328;
	b=3csPmBoDYTIBpBK8CUihWkXC/jYKFbLkhOv3vZoAY5v1LipuuKoHm9G/1PfVekaGYJ/x
	 Z8TO+Z5Cq+av7ZLMEwTYvFrFIL7M2kAr6o2EO2Ve1Mqk7DSU8/2+nJtHbAjQ8vIRzJSlD
	 7jre2whRjxypFjQn+4ah7Ewl5B/KLoCNLIlU722gtQ16m+AZvYzR1mpn/85rP1xQMJsR9
	 QHbzTK3isQIh+2b1th8LjdLC9Cnxb/akgmDTOwqhvKeBnj2s4BQ1L0zfsRVRM9jStgLb3
	 Bnh7pG0ujSarxp/g/EaRfdRTYp6Y9MntOpTQU/+ccVbj1+h/l76WJcM1HAPviruncDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Kkr2HKfNrXjykOWOiy6eWo0NF9gQ7pUiMwlvAPC66AU=;
	b=Am/CHPGOGuI+tBi+BN0UXuspsic7awjJcOtFPeK5i6OG52U4J87Qd3LxFvZ3reNwQlSF
	 ifgP91F3WNfrr0Kr6GU4fEypY7uelhOw/oHDU0YoDSfCBJzbiT55Zk67UEF3xkQoA1dOg
	 GemAvx3pDL1dkos8k1bK1Qn4g994TkX8xsoV0rAR9xAvsjs7E4s5psCL8JXgJ6Xm6VkE8
	 GlNWTp0VDnlfIeE8DkCNg0bFPqGFvugeduTNA/0v24TIIY++z4pa0MM0KMx18bW7KmkbK
	 kyj5sZMdvWyrRsEwpMQRUge68YQ8xlNpH1OE1iGuMBTPPZ8ZlfGwvtqaku83AQl5EXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lUe88F1w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3EC606A323
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 03:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F3EC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lUe88F1w
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so7032318a12.1
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 19:15:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794885327; cv=none;
        d=google.com; s=arc-20260327;
        b=aMmtFmlF483VSWy72nFcDjvihW6GOoiZ4pty/tslJwvWGCAfFRs/uCApEFwU2nm8nU
         0jKtzxkCi8ESjl55sPKvoKU+R+71Gtn5HbsSrznH/Kw9ahWG6Uo1Tk4F7OyzoIT9VDi9
         fEqSfehmf+W5p8+e0PB40BEPjG+HX8v6x68n+FTdrGpHt0Cr1Mkkm4ydKwnW73S9vj9T
         aV36upmLbdPLE9+w4clUBSaMgwtG26+VC++MXjDIyP25WxkQk1chMnSDff9R2ijRrpXc
         ZlMazo+OlG+T/NWr/LNgQRvBz7KBCJrw2scW63H8JCloJVM9PLhV2pJvxypdGAVTYZfr
         kmgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kkr2HKfNrXjykOWOiy6eWo0NF9gQ7pUiMwlvAPC66AU=;
        fh=JjXAubAN87QQjA+ygBRpG7hMjmeaNPsOFLcYmz5wlO0=;
        b=A0zcBuyTdZ1MnZxb7f/oq0c/KYB7WbuVze/HAJA7wfgrcYBFA+whYd4Y3vWorGNh/j
         qL0ruCmGRP29q9M2jiI9+s4YCCgnMuEYTLX09zun1thURI7ltzouDwkap/q1BHhN0Sqz
         +lX72Fc8oOh3rd6RK6WtQRpLDiaZuM87Yo+rT+Ro+cWBUZcTJteaLciA6XTc6c52xcDP
         JbB9ernwHmhThic1iDkOXo8mh3xxsWdQgeaPYr+3n12DlmyATiNwIz1fFzZsHIyMs+cT
         edNvoIC0Ke6pIzRVMboVkr0ZaKHODV0WJwQvoQL3DDqXwfnq+m3uPO4O65sfM7v4pN+g
         +sCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794885327; x=1795490127; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kkr2HKfNrXjykOWOiy6eWo0NF9gQ7pUiMwlvAPC66AU=;
        b=lUe88F1wgybP3V7ObMB957jtIeTOI8NMdrKcaYEcaAu0HXWRa9rL45OswHjpWJj4sI
         sjLnReVAOXIQX9En7tVJJaRJ6Tqa22zZoUDnN1CSj8idc48ohZREWpvhvfYWZotHTTv/
         efqf82v54S0oQQFgOE7bD5IdpHbB3qIGJPfljVjki0ZMBTUr56GJgXs23VUIFUoZ1tOj
         TFdMFFB5jHlB4NVW7BlBLMI0GThuUbkkhqqRDqtQ30cSC0wGcZjDYB3UWmAoKXGuUvio
         NlWYaLUPDKfZRP2gEm1qZ73M4T1CcREkDYk1Jd46RPoBZvFYRVeFEJzmiWCyqXeu1QwJ
         Yjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794885327; x=1795490127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kkr2HKfNrXjykOWOiy6eWo0NF9gQ7pUiMwlvAPC66AU=;
        b=XtIAdAF1DVOcYoGfqSscjacgZNGofx9lSfUBkhkgYz6lh+1yBruhUwxHIhr73iWr2y
         p5ItnGDUqFgqlXetsqjH1B5DAWTaFIaL/pkTE+mdSCCT0Vl2WdOJ7W7DTYMtTFjW4Jyw
         37ZgJqw+Qzzx7ovk+I5/QeRKAd6UxdTXJcs9h6H1lc0ICExWb1UzUWP3/xEeyWGd4AOu
         WeKvkyzmFcqGbY746P/HsSPEi5OsKXMJ726xMKWWxdGjkiJo1Zq0UZWjAjNpFc0OrpLN
         iV4Lo85BNiaDiU30jeWY7QKVRHOUhxtTA7b3L8aJyvBDtVNgp5CQjLPlVpKYFc785aVk
         CJlg==
X-Forwarded-Encrypted: i=1; AL+hErHoya5jurmD0F/TCN/qRgdqClEKHid4iVK6mkzmEvJu0YDeZ04z9e01uQm+/MOFg4NGk+E6@lists.linux.dev
X-Gm-Message-State: APuU4Z+EUMN/dQXtgsz0pigUWZd177JVkSwcZfjiQMgfs7IxKpXQRhzL
	LxZdwKg1u8+SJX9/be37MGAGZJVar1Y88FRfKqArXbk4cCM6WOXcqrj8+YV8miCh6WsEO+tl3nG
	ZzeJ5njurwHr5ctrsRZmoAv/FP5EEyVONNsXIXNkA
X-Gm-Gg: AYBFou3+ZdZTpVlsSkaT827C5KDQbPm0mX6OdGZYORByaDnmQ5gIwu+QvYX86Aexbbi
	3U3lRiX1rMNWmGTA8RN/RlTv42LCszw18teWYom1AflyRTDDPO/RT/UNgcE+91fQGoEsjf06FsO
	nwiZGTIoYz1+9mDYiFcE92MFfJWRMZBeeiimiAUgaX59EUFgLtE4Jp4mSBojOGxMcUPEGXa1OBb
	FL3pu7KuW36mJM2zkxKq5yXN19aa8sb+2nlExXFNDqsBRqOy4W1NLRgsPCAyUnN+OiyKV+d55vp
	HS/ZE929sgk3hHCyHY0FlOKCQK+4xvlopaQ2NI8lX5eZ1MwSib6Jvo5uRlKhNSkyVjppbjjXU24
	Dxg7oT1j1pktc6EiLM6/1uhKtoVhB2qXNJ+L7YNioXe6ygtn/md05Ioklb7y5eNTZPUDHw0Q=
X-Received: by 2002:a17:907:60d3:b0:c31:8441:35ff with SMTP id
 a640c23a62f3a-c50968355eemr1101863766b.48.1794885326369; Mon, 16 Nov 2026
 19:15:26 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com> <20261115142431.1587690a@pumpkin>
In-Reply-To: <20261115142431.1587690a@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Mon, 16 Nov 2026 19:15:11 -0800
X-Gm-Features: AclHuK-iBEn00_VVuz6qjGQnwYZ5FRJ6bny3VEMRskBOJf02b9BDmwbxXueDduo
Message-ID: <CAG2KctpP7QH=tdSB=op703rA=CtjQKAXqOen8JEHg1ygy9sgyg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME and
 KALLSYMS_QUERY_BY_ADDR ioctls
To: David Laight <david.laight.linux@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 6:24=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri, 13 Nov 2026 14:12:45 -0800
> Samuel Wu <wusamuel@google.com> wrote:
>
> > /proc/kallsyms is the primary interface for userspace to query the kern=
el
> > symbol table. However, resolving even a handful of symbols or addresses
> > requires reading and parsing the entire text file, which is often sever=
al
> > megabytes and takes thousands of read() syscalls.
>
> Separate from this, I've wondered about separating out the /proc/kallsyms
> code from the code that actually handles the symbol table itself.
> The two parts are pretty much separate.
> IIRC it uses a static function to get the symbol type (which does most
> of the work of getting the name - which it also wants) so it isn't
> completely trivial.
>
> I'm pretty sure all (well almost all) the changes will be lower down
> the file than my changes and won't cause (hard) conflicts.
>
> I've been compiling kernel/kallsyms.c and kernel_kallsyms_selftests.c
> in userspace for testing both, but had to cut the bottom off kallsyms.c
> to get it to compile with a sane number of definitions.
>
> David

You mean separating the core symbol code (top of file) from the procfs
interface (bottom of file) into two separate files, right? If so,
seems reasonable to me, especially since the file is approaching 1000
lines even before our changes.

And agree, even with both our patches, most functions can remain
static in their new homes.
