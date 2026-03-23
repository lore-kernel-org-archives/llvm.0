Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B043AB277
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 13:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272913; cv=pass; b=eRERYN2o6+cJC+YwmEgrUm1XPBafnAv1ekyd380LIrHthvbCYo83+3yw41EfYZjsRpkd20tYRk89nJtEwyKznHoUrxUPfNsRg9novfasxWpK4kINAhGIrCBicuZ9b8x/y2Xm6Jf/iTCHLrkHXRAKJpjUBIuIYdps2JCUQIPhW7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272913; c=relaxed/simple;
	bh=BWXOeU1wWl1XEOCGumiVY0N8hZzx/EKsLDL4oWg6ZXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=js/+g+NnvJNbv9h6F29w9AU84xD/NFxWq+U+sJGR+mZgoKSeNwuNarIpgh6XtrUM9GEvjbQEGUFH+Fi0O493UacUqkN4R5g6LoQGDgQEIdzOBxixl3ekG7T6Q3mKU5NYCzyQ99yBZj4JzWjzsZwbjC4MnOHA8j2T2/QEFXD+ApU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPpqStEK; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPpqStEK"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bd5658b901so155631eec.3
        for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 06:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774272911; cv=none;
        d=google.com; s=arc-20240605;
        b=U/4FUVbC78gB8MmFhaju0qdMNnB5+HyxKvLSvcH8SQYymDOszfsov6W28w6fdFyeyB
         d/Se0cKaAkYTsIy3xbx+0SwTn6CzWV921KyK6SCg9pdjHEIVWt3K8S7XTbgg7ULQxwXt
         JxylbKgbafIkgsJiWn93Q3JL5fHrdfUM4ePUXp5SLktUtci/4vwF4KgVxLu4qPq0v5Xs
         b7DBW2nbiRYZJ3xBxt3+ZSi123hDVgh/Ai7W45xmgEr7n7KuV8hc24eMUHZyFVlf6SL0
         i2Zx7glHjOuW8Sg5/bYs+mbGNEIDZ+IRUeaVpcrdru2fPjo4o9JqiD7iSI2Y+DJi0G91
         JsnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P5oJqHAVX7zT2HPF6s22H5/MvQLO5sXIIazXAuipXIs=;
        fh=XsrhsRPBg//UYBsb7yaI5gGb9/lfGFyzjP5lPwRJKaQ=;
        b=PJ5fPw3ii8UyLpObMl1+7dn0raV12s+DiI5C9hIDb2gIvyXBskV+zKY58sWjC3Cmfw
         8va1J3X78ZfC7hkKGi7jr0boBTLUI440yUZvLbvVdM1YTghSpfqXQL//9Xy2ADiE+aMD
         hthB5NNCInUnHmLDzKtChfRXb9IwqN1Ne7uTyStvLNPfFJ10mPNd33XY+d9V0dCEidQ9
         C8daUlbCPbYo+wtp9pjgVhhzZ7a+eRU5Z/WmRS4wk4NoD8vW+TAAOd6hkoE6LScs09/y
         u7v92Y5KZKSBRH4q7O2Y5mDCn0imI0Mry0PwuOIU6k9T2eyGrAfAhB/NOfaf/1NO3I23
         GJfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774272911; x=1774877711; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5oJqHAVX7zT2HPF6s22H5/MvQLO5sXIIazXAuipXIs=;
        b=nPpqStEKyFHSaR1t1v17qkD+gcJrWqBqBa3beSZVVxSAhCNjIbfSgewof8vccos3GD
         wtDNI5Xeru8x5mcc1W+oAVcFKH6mb0lL7eD+oSZa/QpAYAQcd279Jp19TNkzVhUf0NNo
         CqqghpGEmn8uEkEYty2auebpRkoPO1Ph3lnrcZ+OxD1qM1RBYqgK8nyOBEghX5vnCa5n
         OEjASMyeX0EeIeZNYdqzFVadQPKJw0ct/0V5Toeo9yy4fe1iVoH5fIXMtE6FBP4GpN4x
         OCW5owbO9YVqs/2TMlbEW+OecA/xANq+J28dyi2VGiVVb8LJFIrZhFbMpafP1FaINC+q
         H3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272911; x=1774877711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P5oJqHAVX7zT2HPF6s22H5/MvQLO5sXIIazXAuipXIs=;
        b=IqpChXlXmr3bXWLLmj2FgFxFot1FHaVMYUEtaWgpmZSEvL7SxQ5ExYDl6WZkrlFCeJ
         j6M1fqYFnocIN/1t4hFxlzcX0NntFplIuOayp2wxvVYkJkNwC4z/YhUoUFmcxkPlusP1
         189sxZOSKLlL4IUr0N1WiEiKax6NSym0Rle430YCcg/na6SvhHKS0zCkoCpDZVoaPGtV
         yUVAZAubhxnJ5aLvBHqY3pwQ+SsFgMwVzZs3LSZcSTADYqV/AFGKtR4cqh0bjfdy0MTR
         QR5Z7bPJY57UwifMmOPFWV/cGDR0naCEObdf8bz5WRvNY5JbWI0nHoaghRCVv4d8loCv
         XCkA==
X-Forwarded-Encrypted: i=1; AJvYcCXz46ZgodlWZDDCYJwvDX6cECODXd63DrM/vqySnkn8cv3Yw3QO3m8c9a3DCmEC4+EVqQKg@lists.linux.dev
X-Gm-Message-State: AOJu0Yzuw4/Jd5zqmeAzyAOQ2YAXcWiVpv7nR2y/PW+UTdzg2LB674te
	Hn/f661DieQ+G/YAS4/tlHvuTqMLZscJWoVXsDyfNSLBI7aXl1KtLHJuBWtktdur2TPyrQqh7yU
	B2FlS07VtNf00TOh1WJw0P3YFoerR1wc=
X-Gm-Gg: ATEYQzx+UxW6kUKek508pOZF2KkZeb4ceh7cvJnoWWnv+yCsQ3GJ/IFSnlTkbA2rr3S
	QNYv+utoeNQnppZnkIrzUXtgvhMO0IBmu11undBJLJKpYzwBn77rIYNtTODnZxEevRrl15HN5kD
	VQ8GUPKUYlD3acUGV438XiQHT9eIfAgODiXwmyD8VhXqnpKu/lfSfAAyFHgSe5gGwQ6ousdFpnD
	2I0p5zl8QVByL13a/NCq/xBeCxTPaIVOCvTM2fQaMyPqH9Rg1QVonKKLSFcshrRuxsdd0YvTryb
	VeIgjdm5CzErcUY3ocsb4bd0H6jw6Oh+wtC7CrirBJJdidKTxuxwGxBMNOhksG8+QTCznArMsBZ
	sXxFIzorzpi7FvVAPgJwZCyAEEYH3OZDUgg==
X-Received: by 2002:a05:7300:5711:b0:2c1:27c:75d3 with SMTP id
 5a478bee46e88-2c10956c2a3mr2435566eec.1.1774272911337; Mon, 23 Mar 2026
 06:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch> <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
 <65336ad0-ac37-416f-b6ae-e691e3e375ae@lunn.ch> <DHA6SE9EMEQF.1PKVHEG18I5FS@garyguo.net>
 <b5063e7e-9245-434e-9877-5ac7b45f4bc7@lunn.ch>
In-Reply-To: <b5063e7e-9245-434e-9877-5ac7b45f4bc7@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 14:34:58 +0100
X-Gm-Features: AQROBzD7g_rNmuMWaBSXTkod6GcGExC_6-5XqRdaJnhqw3z7WBAm_JnLMPlOCtE
Message-ID: <CANiq72kD6HVrDTjQrTXDujyjA4Z5ELM6Nh8kFfVfNXrvpfU1wA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, 
	acourbot@nvidia.com, akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 2:28=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> So it sounds like my understanding is out of date. When the first
> Ethernet PHY driver was being merged, Rust could not access inline C
> functions. The binding had to replicate the functionality. But you are
> saying that Rust can now make use of inline C code, but not actually
> inline it? It results in a function call?
>
> What this feature does it actually allows inline C functions to be
> inline? So it is just an optimisation?

We have always been using the helpers to access the inline functions,
please see the top comment in `rust/helpers/helpers.c`:

   Non-trivial C macros cannot be used in Rust. Similarly, inlined C functi=
ons
   cannot be called either. This file explicitly creates functions ("helper=
s")
   that wrap those so that they can be called from Rust.

It doesn't duplicate the functionality, it simply forwards the call,
i.e. it is not as bad as a full copy-paste of the implementation.

This patch series aims to improve performance (cheaply in terms of
built time) because for Rust calling those helpers are not inline
anymore otherwise.

You may be referring, instead, to avoiding to have to write manually
the helper (the forwarder) -- for that, please see "Support static
inline functions in headers (by generating a wrapper)" at:

  https://github.com/Rust-for-Linux/linux/issues/353

(In fact, I had your previous mention of `skbuff.h` from Lore there :)

Assuming `--wrap-static-fns` works well etc., then it would be nice to
use it, yeah. But that is different from this patch series (and this
patch series would apply as well even if we use the automated wrappers
etc.).

I hope that clarifies.

Cheers,
Miguel
