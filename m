Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D191D1F1536
	for <llvm@lists.linux.dev>; Tue,  1 Apr 2025 11:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506015; cv=none; b=JsvN5nCQxpKZWGzfaQ0Ph0sROS2P+NW2rCFwIHIO/ioo7HjRqECg8Wi2fCojWp7VTIRntBhKpPqO1oTIGr/Vv+MyxMXaUo/ttjQiU0qrNFNUjf/yl06T6cAf6ODCjxBOYr+FvO/CNYP1n3myHZ/UX1YjE+tltv2O9VLNi9LPpuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506015; c=relaxed/simple;
	bh=zec2RCMRClZzaBv/89qRA4s9VgNbDdJvUtT/oGpfa0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MszKzXHeTQRzNndG2cLaGGfSgVLXJjvsGcHJAD0F3q1LQCKPKhab93ytE2rLk0mtmc5M1eWlm5lKz1Ap0IQ1+aU+eUo+ZRPNUrAi4iWDlnhrhPIGjpCr3DUxD9YJyk7u9std69/JzRf09Lhm4Hkcm6pBwZs9DQqN4LB8XH8ZkCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gp0q8F2p; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gp0q8F2p"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8f254b875so50122836d6.1
        for <llvm@lists.linux.dev>; Tue, 01 Apr 2025 04:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743506013; x=1744110813; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RhXqDSYOjOxsXszNE/hmSOtQ7jPTUIhg+8zdDPCBQfc=;
        b=Gp0q8F2pSKIKymTPKyw8cOXu5Sxs8nnfJU+pIdcrF7C8kQV7R4hxjII/LGTvIzSi2C
         v+Bg8uvaJSedOWXhbLY9mbMEPUSVJBxZK/uveH1fwWzg/BMN4EN8PQ/2Z4qPxNw+JaCL
         BmN1TXLGuCcgM48ZKR12n09ZBePH0fOkKhHpzAufKhcDUuOl38p1RSJGqAo2zDV5fw4c
         R+uzwqDy0Tn3/pe3Ci5V6WpxFlcnuZiwCHxzIVFg2RiWu2DO4s0/UEh8tvvbQ9WQct2J
         5Tt1D4KNjtSl6U+G7v+ISBXOo5cC0x34ap6WwGUWOUHUVUxMOLMFehrh71zWQ2OviaJX
         WYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743506013; x=1744110813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RhXqDSYOjOxsXszNE/hmSOtQ7jPTUIhg+8zdDPCBQfc=;
        b=FLJjTbdAml5R9o8G26gPWXtnL8J0PDysN6khvddcu0RQmCdItYMknrkRRnhTt+lYhs
         CWYIWAVzFRIP0HBWydSG3HlwE7aQy5yf6a5xAsX081ktPaYJKPUHv7f0pnLSVZtY6xmJ
         dD8DLlcdf07GVD+wn8dyQYzSgWcIXBXypntU5LCp2SLWg8NfqwZUPKLC7pAtPYH8YklT
         JHrizp+aXkChr7IyYUIA+VrlIK422ZeHYHX9+RQlCgLICDr3xM5ei9/OeIiw55C3VS1I
         4u/d+4+QraE5PSEmeqj6fjnPWrTNCCXwSLSfaUpBwYXgljqZ5QT4mmBsH1LWQEalmEE2
         F/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjbkYmVBHhokQLESaPYGmhWdbk7C0t7LxQ4NHFXWSYEKCGZqEeEQ0ShpgDKkrdJ8dDfd1i@lists.linux.dev
X-Gm-Message-State: AOJu0YwcgL400OoLewATA11AgG/MfvCZsa+R2Hfop8ywsyOAaJiCphhG
	vBGzxbPINylkQHx+U1DFf1UUrGxbcBYE1OC43H5pS16AGEHqWFV6NYgfLCSL8gRs0Xf+kpHx2CA
	yo3vORPZRYr/3lI+O0HRS5KJgcLU=
X-Gm-Gg: ASbGncsQrABZLbRjWlNy0IEyYNHITNKJFGMyAanya2BWnl4WxYKJCYkCzVfEplf2gz3
	TBnrQH7YXWAIRjflppjKg7jri9UFq4Dk6uV4Wfw1q8q2cOzvwjkKOM9xa3zbnUYbF5+BuWHwHMs
	K5p+00TCvdqZo+43/PDXBUBkWO
X-Google-Smtp-Source: AGHT+IHo5fEJFngga4+GOhfC2NhUrJuj08Wu097yQz8MreDqZ8dmYQnArSlhZCL4U3YiLwUMSk6CWpiamq4vswZAjMU=
X-Received: by 2002:a05:6214:1301:b0:6e8:e828:820d with SMTP id
 6a1803df08f44-6eed6226e16mr263447586d6.36.1743506012761; Tue, 01 Apr 2025
 04:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250114123935.18346-1-ansuelsmth@gmail.com> <20250114123935.18346-4-ansuelsmth@gmail.com>
 <Z-vFkUmd6vgciU6V@gondor.apana.org.au>
In-Reply-To: <Z-vFkUmd6vgciU6V@gondor.apana.org.au>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 1 Apr 2025 13:13:21 +0200
X-Gm-Features: AQ5f1JrMsiz9OVJ4AuViP6vrfqHG0abox8RT085aKR8cHOMDja2lm3-nBFW-_go
Message-ID: <CA+_ehUy0qHfQseVv4D4BbZa+wHKTCvY9dVNfUtcDF3x7XHss0Q@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] crypto: Add Inside Secure SafeXcel EIP-93 crypto
 engine support
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Antoine Tenart <atenart@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, upstream@airoha.com, 
	Richard van Schagen <vschagen@icloud.com>
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 1 apr 2025 alle ore 12:53 Herbert Xu
<herbert@gondor.apana.org.au> ha scritto:
>
> On Tue, Jan 14, 2025 at 01:36:36PM +0100, Christian Marangi wrote:
> >
> > +static void eip93_hash_export_sa_state(struct ahash_request *req,
> > +                                    struct eip93_hash_export_state *state)
> > +{
> > +     struct eip93_hash_reqctx *rctx = ahash_request_ctx_dma(req);
> > +     struct sa_state *sa_state = &rctx->sa_state;
> > +
> > +     /*
> > +      * EIP93 have special handling for state_byte_cnt in sa_state.
> > +      * Even if a zero packet is passed (and a BADMSG is returned),
> > +      * state_byte_cnt is incremented to the digest handled (with the hash
> > +      * primitive). This is problematic with export/import as EIP93
> > +      * expect 0 state_byte_cnt for the very first iteration.
> > +      */
> > +     if (!rctx->len)
> > +             memset(state->state_len, 0, sizeof(u32) * 2);
>
> I don't understand when this can occur.  As far as I can see,
> zero-length packets are never passed to the hardware for hashing.
>

I did some extra check on this and you are right. This was a leftover
(and discovery) when we were discussing on how to correctly
implement import/export.

My initial idea was to send a zero packet on export to sync and wait
for DMA to finish. But this was scrapped in favor of -EINPROGRESS
in the update function (that wasn't aware of possible)

If you are ok I can send a patch to drop this (and maybe leave the
comment just to document this strange finding)

What do you think?

> > +     else
> > +             memcpy(state->state_len, sa_state->state_byte_cnt,
> > +                    sizeof(u32) * 2);
>
> I need to know the endianness of state_byte_cnt, which I presume
> is the number of bytes that have been hashed into the partial
> hash state.

It's LE.

>
> I need this because I'm changing the export format of all ahash
> algorithms to match that of the generic implementation.  This is
> so that you can seamlessly switch between an async ahash and its
> sync fallback.
>
