Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B7F4A0143
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 22:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788906880; cv=none; b=fGIJwUOvy3OHKFnexS2tUqM5jNJPQySrLd/BHuIQFs5izRaRh0I27vlbsdGFeombV2IWnSw3xJGoEsAZ6op0CbKsuKnUld14TfazrVunUFEf6BTqaNrYMcatVI2M7gyJJukq8CvLB1F04UGDDUDnAgUD/eEzyTUHev+Jp3NKkp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788906880; c=relaxed/simple;
	bh=htNILk9Kpq12336HFpWbDN67/SR46TQMYtfCjV9wRxY=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=oXx2aCQFFOhXSfsq677i6QoMXUREWosg8k1aMsE22RAXFHgcrZ0eXo1uTCDnR2PBwUP/Aw1Has2cec3q5I8ECUmwpvIm96q/T5TI7f3a5egbR1nUXUhiCpJjKpKbK/ZobhJvVHqdCfjHJqkFY8daG+5zcqs26JSpqWq6tar1lQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ua9tGNKQ; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ua9tGNKQ"
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28d9952a5so6306192b6e.1
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 15:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788906878; x=1789511678; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y6DHdss8MRJ7r65GA41ught1FKJ932kAtSg2l2oUqQc=;
        b=ua9tGNKQ3On/mqtCHKIGWYyLCXt05r1KGO8KWNUtsDDG/HoWgajcV9HfzD33MvG1tB
         W9Ef0hV4Uzh5RNqWX48izLEEAZW9u3THWasGexCMuVKk+uzLCMcNoAFUACSxVRWTBIEq
         lGW1+xD3rNQEq+t6fwMX647dSdo5LItJhYSo8izirwoby6WYxOsuWve4vtZKFfj+/G43
         PQLWHUXVRYbyynP2Fm2TA3FeXGobpsGTipavikI2EuE6l0L2RijXEZZsFc3ODpyWOYJM
         nchp8aPOLAJSE1jEPGiQSARINhZ3Vd2PB10M4E5Z27JrWqe1oXl+H+73LbtDKP0IXUPl
         V4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788906878; x=1789511678;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y6DHdss8MRJ7r65GA41ught1FKJ932kAtSg2l2oUqQc=;
        b=L79OGCGcUjJJ7yeeDJ4aSyUeyiGzPbHSUNT/ZajD9dq75m+FARzSVwS97PoX1kki7e
         f+660TkoaapoMeBCg8vn7SnS1bshZPWd9U27OpvVFBQDGvaEcHw98VHTIWkq2Vke4dHL
         w5gtb+4I84ithPZJfMLeZlgpvTL4PIdoPPafsWnVL/IddYvpVT3MajPQrrrnkzfWFEji
         Ir5I8bqs4vGjEkz9s/cvydq5+nHGdFSfKMrJQ9HWR/kfnQsvcCtbgw9fVEZHcYH36KO/
         HKAZUIixOCnDmjW0Jhk7yNPeBQ72s3RjqWNHAQzVz8IeoqgIInqr6aSeLsNr36ok+MP/
         aP2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwBHYFltzaf5z2GwbiIptzsaZBgBs+fjg0fe58WwgWXJuHlomvY3VeelCxTCj7SUnww2gbY@lists.linux.dev
X-Gm-Message-State: AFuF++mY4fSpNSskvAE7JwKOUvw6yZZxOlWo0QdiOeELqFGCSY23wVPY
	qY4NKOi7+2IM3LpcbVqJ752JVI2mRpWrbaYAOIxKn03SZZUXUcJVy5GDbDKOO6jDpl5HrrS3Ru9
	RW4VF71xgi2Kpc+YuKEQGW/9UwA==
X-Received: from japm26.prod.google.com ([2002:a02:cdda:0:b0:5f1:325b:8e4c])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:179b:b0:6b6:c0bc:365c with SMTP id 006d021491bc7-6b6fcbdc9dfmr18638803eaf.22.1788906877369;
 Tue, 08 Sep 2026 15:34:37 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:34:35 -0700
In-Reply-To: <20260401092027.GW3738786@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-ID: <aqCMIFRHEQ3H9qad@google.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
From: Justin Stitt <justinstitt@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Vincent Mailhol <mailhol@kernel.org>, Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

Hi,

On Wed, Apr 01, 2026 at 11:20:27AM +0200, Peter Zijlstra wrote:
...
> 
> So I would like to second this option as being interesting.
> 
> But while pondering it, I did want to note that all of the options, with
> the exception of __ob_wrap (which is effectively what we have today for
> *everything*), will be 'interesting' to compose with _Atomic, another
> one of these qualifiers.
> 
> Now, in the kernel we don't use _Atomic, so strictly speaking I don't
> care ;-) But here goes...
> 
> Something like _Atomic int __ob_wrap, is trivial and good.
> 
> _Atomic int __ob_trap is either doable or impossible depending on how
> you define the result to be on 'trap'. Specifically, the semantics
> proposed where it keeps the old value makes it impossible.
> 
> And _Atomic int __ob_saturate is equally 'challenging', since the
> fundamental thing of 'reset to min/max on under/over-flow' is rather
> a non-atomic kind of thing. Look at the trouble we went through with
> refcount_t to sort of make this work.
> 

FWIW, I've moved to simply disallow OBT+Atomic. We've got this under
-fexperimental so I'm well within my right :). The idea being: __ob_trap
isn't workable with Atomic (depending on storage semantics) and
__ob_wrap isn't very useful there either, plus I had some parsing bugs
where specific ordering of things could result in OBT being silently
dropped with _Atomic and those magically go away by disallowing this
pairing all together.

I just opened the PR over at [1] and it is still pending but this is
probably where I'll go with _Atomic and OBT :)

Link: https://github.com/llvm/llvm-project/pull/222179

Thanks
Justin
