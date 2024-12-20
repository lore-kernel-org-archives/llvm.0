Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AB25383
	for <llvm@lists.linux.dev>; Fri, 20 Dec 2024 01:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734658753; cv=none; b=WvxpiT+lgA+eQ7q+enwZ13S8RdKbSy4K28f3Wxiz0n93Za+btzJ802+UioB+e+MK+Z4m66Yet/ur0BYSXY1Tfi4fFcJedSags9Wgsrm1t7X5Zl4LtqnLS/ANkGe72Pl3WfPTmMUuKXdnT1hUdvegH9UcAUpqn40L2nke2Xhaj2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734658753; c=relaxed/simple;
	bh=RUR9VakavhHiRpSXE57jpumSk39wQYg3tyvdb6QPeLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T1YvTT7O/vsnaYwrr4vLK0/VYfMHYNPzBsn5KlYNKeYnfzcAWZaJyW1Of+FyIxnEx3dISM2pkkpigMqg7gwyVJ1sz/xqiTrGQ61XORDpf4TVOhYKLxBUO+zQO20pNfEfi2/VjK8Iqx6qhCs1/OEXLiXwZA+q05ghlMOdfjBWyF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=kj+28wbB; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="kj+28wbB"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-43624b2d453so15102105e9.2
        for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 17:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734658749; x=1735263549; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4ebt9RfFNlU+kCB4CV1j8AEPPTxXG9SHQgcbE7oz8Lc=;
        b=kj+28wbBqOvd878L7z48cSZLKVtvgwq5Gp9PsP3gW+Cx4tGO+ZJMYRMXIB3pNaSUqa
         7t1VKQSZz7miesrFA9+e6exRkf8/jryVaIYBCoZZ37GYg/QDs3gryh4s0JofX0W/H5Lf
         gei5RSo7kBqfYubEOKSrTJwkmsGS3DLWqti3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658749; x=1735263549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ebt9RfFNlU+kCB4CV1j8AEPPTxXG9SHQgcbE7oz8Lc=;
        b=sCrKQnxJuySPexPDGDn+M/jLkvY41twMmbCS1FPFS56BZqMshHOfe5ZLn80dXPuSWm
         z5QgZ5UVEif3CJlAXaZvDjPnBnDxkZNpYPuxL72buqb8BUxdihjGiyWbsbTdH/0CA8Im
         xbBZPbmRLnhM0wNPFWZXAwuUd1rlTvW7ujeBth50kzfIWRR/Taa+TjqfKDGhkE5e/7AG
         gR558pMT4yEWteIdKlII3Uv9K1jrx98KFKOeqJkwK2E+RCjzEE9bZd7sd7mYOEd9L5cx
         +QLAK3iQG2/ELb/eAlb/POp/yoelIba6I2pnh3NA85/m5N5zQAvVAqdZcQIA3qAlEeqc
         goyA==
X-Forwarded-Encrypted: i=1; AJvYcCX4i7lS0bswSJf9vAqUfnqtLg+KEgRZty9z8SD//ijAxLFXtxzDUpTsxxEtztP4D2yCsflY@lists.linux.dev
X-Gm-Message-State: AOJu0YwnKm9CEEOVmjuJY8ApYApSo5SuJmlH94ocmxb8vdemTIYQPQFu
	d8pQ1Kv20pf1iDHIhqFQZz6FVZr2xCUu+uV8FtMOyMgGsAHxysNnaNfzFnE4lsc=
X-Gm-Gg: ASbGncvHYsIV15RhAaC7EkBwDt1P11xM5TQfm5yBPpaFYNOAMUq7Z/v0SaKJHn9U//T
	t3gDQZP0WNWYvr7fglaiGiJLkGYoEvMNBfNZeHpYiMGO1ZJAM5OHDLA6KEdKTWB5IvrFsZidJne
	6SluA174rFg+CBYEmMPJsO2vaz52bbb9gxqQFPW3VvuHeQksNl23P2DSUDs/AmW4V5lLafB9F9N
	AVV7vV7EhRipKF4x0aoC4YFZX0IxpA8ZRysmCdTpFwMRTqqOJ8o5BA5rEvEzfeQYuTovk1qZReu
	vGSYEB68n5f455qdp1SE
X-Google-Smtp-Source: AGHT+IEaM6MkZFZl3KmiAg6nD02zKSlYWnEyf/5dVUkNhm+rsElC7GOnheMem/9YEpGNrUbt2mLwbQ==
X-Received: by 2002:a05:600c:4fd3:b0:431:54f3:11ab with SMTP id 5b1f17b1804b1-43668b600c9mr5900845e9.33.1734658749151;
        Thu, 19 Dec 2024 17:39:09 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366120088esm31993515e9.13.2024.12.19.17.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 17:39:08 -0800 (PST)
Message-ID: <43166e29-ff2d-4a9d-8c1b-41b5e247974b@citrix.com>
Date: Fri, 20 Dec 2024 01:39:07 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-6.12.y] XEN: CVE-2024-53241 / XSA-466 and Clang-kCFI
To: sedat.dilek@gmail.com
Cc: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>, Jan Beulich <jbeulich@suse.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
 xen-devel <xen-devel@lists.xenproject.org>
References: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
 <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com>
 <CA+icZUX98gQ54hePEWNauiU41XQV7qdKJx5PiiXzxy+6yW7hTw@mail.gmail.com>
 <CA+icZUW-i53boHBPt+8zh-D921XFbPb_Kc=dzdgCK1QvkOgCsw@mail.gmail.com>
 <90640a5d-ff17-4555-adc6-ae9e21e24ebd@citrix.com>
 <CA+icZUVo69swc9QfwJr+mDuHqJKcFUexc08voP2O41g31HGx5w@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CA+icZUVo69swc9QfwJr+mDuHqJKcFUexc08voP2O41g31HGx5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/12/2024 12:27 am, Sedat Dilek wrote:
> On Fri, Dec 20, 2024 at 12:26 AM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>> On 19/12/2024 11:10 pm, Sedat Dilek wrote:
>>> On Thu, Dec 19, 2024 at 6:07 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>>>> On Thu, Dec 19, 2024 at 5:44 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>>> On 19/12/2024 4:14 pm, Sedat Dilek wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Linux v6.12.6 will include XEN CVE fixes from mainline.
>>>>>>
>>>>>> Here, I use Debian/unstable AMD64 and the SLIM LLVM toolchain 19.1.x
>>>>>> from kernel.org.
>>>>>>
>>>>>> What does it mean in ISSUE DESCRIPTION...
>>>>>>
>>>>>> Furthermore, the hypercall page has no provision for Control-flow
>>>>>> Integrity schemes (e.g. kCFI/CET-IBT/FineIBT), and will simply
>>>>>> malfunction in such configurations.
>>>>>>
>>>>>> ...when someone uses Clang-kCFI?
>>>>> The hypercall page has functions of the form:
>>>>>
>>>>>     MOV $x, %eax
>>>>>     VMCALL / VMMCALL / SYSCALL
>>>>>     RET
>>>>>
>>>>> There are no ENDBR instructions, and no prologue/epilogue for hash-based
>>>>> CFI schemes.
>>>>>
>>>>> This is because it's code provided by Xen, not code provided by Linux.
>>>>>
>>>>> The absence of ENDBR instructions will yield #CP when CET-IBT is active,
>>>>> and the absence of hash prologue/epilogue lets the function be used in a
>>>>> type-confused manor that CFI should have caught.
>>>>>
>>>>> ~Andrew
>>>> Thanks for the technical explanation, Andrew.
>>>>
>>>> Hope that helps the folks of "CLANG CONTROL FLOW INTEGRITY SUPPORT".
>>>>
>>>> I am not an active user of XEN in the Linux-kernel but I am willing to
>>>> test when Linux v6.12.6 is officially released and give feedback.
>>>>
>>> https://wiki.xenproject.org/wiki/Testing_Xen#Presence_test
>>> https://wiki.xenproject.org/wiki/Testing_Xen#Commands_for_presence_testing
>>>
>>> # apt install -t unstable xen-utils-4.17 -y
>>>
>>> # xl list
>>> Name                                        ID   Mem VCPUs      State   Time(s)
>>> Domain-0                                     0  7872     4     r-----     398.2
>>>
>>> Some basic tests LGTM - see also attached stuff.
>>>
>>> If you have any tests to recommend, let me know.
>> That itself is good enough as a smoke test.  Thankyou for trying it out.
>>
>> If you want something a bit more thorough, try
>> https://xenbits.xen.org/docs/xtf/  (Xen's self-tests)
>>
>> Grab and build it, and `./xtf-runner -aqq --host` will run a variety of
>> extra codepaths in dom0, without the effort of making/running full guests.
>>
>> ~Andrew
> Run on Debian 6.12.5 and my selfmade 6.12.5 and 6.12.6.
> All tests lead to a reboot in case of Debian or in my kernels to a shutdown.
>
> Can you recommend a specific test?

Oh, that's distinctly less good.

Start with just "example".  It's literally a hello world microkernel,
but the symptoms you're seeing is a dom0 crash, so it will likely
provoke it.

Do you have serial to the machine?  If so, boot Xen with `console=com1
com1=115200,8n1` (or com2, as appropriate).

If not and you've only got a regular screen, boot Xen with `vga=,keep
noreboot` (comma is important) which might leave enough information on
screen to get an idea of what's going on.

Full command line docs at
https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html

> dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner --list functional xsa | grep xsa-4
> test-pv64-xsa-444
> test-hvm64-xsa-451
> test-hvm64-xsa-454
>
> Is there no xsa-466 test?

No.  XSA-466 is really "well don't do that then if it matters".

More generally, not all XSAs are amenable to testing in this way.

~Andrew
