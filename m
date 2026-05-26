Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F1C3A963B
	for <llvm@lists.linux.dev>; Tue, 26 May 2026 12:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798114; cv=pass; b=eV3svjW2EjuMtaCW68RLRETxDnsZlYJYHMrQ/FhLjH/+ouI6+MMTrgTrfHPNxqdf3IJm1+34U7o9dsmhy30O+zNiSmvVQqEv9VpP+ChWGTd4dHHj7bbuUYYGGNsvTStqnKVPolD2MuL/uHM9ffN38VRFIuHwROONyMJvazXoiOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798114; c=relaxed/simple;
	bh=HJn5baRVScE6xD2wHYFVG8MdWdyU6wVQsFxtKnoFAoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XaneZXeFBCecKqOXTnqsi4QC4a0rlKt8CgzZnB0ixn2q465QVtXvqAX7uzA1kq/oWEM/4fdnxTrCyjg3qfWquWIxjx66zLA+O+z/1PhL3BA1clBjINCl5g92Ok3lvIXNP7dVkDn9S5R1sOFKtN5JyVN0sf45SZ+shvdXqpUIF5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVSYEpxV; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVSYEpxV"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f53c6af46eso747298eec.1
        for <llvm@lists.linux.dev>; Tue, 26 May 2026 05:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779798112; cv=none;
        d=google.com; s=arc-20240605;
        b=AaEhPbWpYgBvYShUY1m9eHvvYFBYmBZmFbkmOFZd0ILr/Wk+Gf309zL38kG4i6CmbC
         6FJknuy0XaVwxpYqqR4zXIHM3u1efG4i3dNPJvZcyy8o4zmTB0xCh4038rOtubiFbhDK
         2nwwy8z2q27HdKaF0hzmBIAh2u6JFtXazG/GEoHU8uTot6YcCu7xqel6njfNKLCxO9bR
         0iRzTSVJS1dqN0VUCdqz01wohkMzwtBHmg7qEkxNsQbXXwYi8HzpoMwtw5LSZdRZvLmv
         a/H2FSdirTptiUKGWbzBycCSVChDfXZJBKKUDZCr+ufJN3y+aTWAis1fTITuydeICGdZ
         hcWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HJn5baRVScE6xD2wHYFVG8MdWdyU6wVQsFxtKnoFAoU=;
        fh=dkzGeVthLRQ/BF/yPDUDYZ5qJZqzN1jrQNN0FqIQthE=;
        b=BZ4DHjb1dSaV0v4lIScpM4mDhNbg0Y7mX/Uti280UUVcA0QUXveOfgLFyisU35K7Ik
         TQmXc6a/do0C/7p3mEF62xcm7mesJF37T0Q/Ub7sNuSmbOYCrb5+cpLlCEMMc1Syo04W
         DYvpX0MEyDRuJoLYg9Yv5KIMpeNKOGExgARpJ1Q7vUFCBrQfQ+/zi4sDXfafiTPUBr14
         Ep37VWFCk+qb0mgRWfZodsMZd1PH+tDK/XTmkEZzXfqUVrFX1vvGpadNYaBtYe4jL2fA
         bllwsmxRtsfgInoFHj68sZy5zLq4QyH427Fycop0iNd/FWErzbkNQjRL/CBbuLiSxpgL
         3Yvg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779798112; x=1780402912; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJn5baRVScE6xD2wHYFVG8MdWdyU6wVQsFxtKnoFAoU=;
        b=JVSYEpxVe6gGd6zuMsKSx2ZAnNxub/rBWCdzCrkScee6c6yaoXnxQW4QFGJQAaNdrs
         cC8P4rkAXmX0CPsfpzWUHRGzkMlzGQiYmLE46A/WrSbDo6Htxmun9Bag/GL6NxCLlReB
         UzUH4925UKKf1L/bKEb7AHm5x4QWFrhOIHkSfMHiC6L6v87w872VWgU1pbHfAEJNMivX
         pE/as1sHW77tZZh6ILfBjY7E4OwE5gQm2wWbNNfYPFn9QBlkrwBhJAB995al6qCdG/NN
         wD+74KO3JcpnERx43w0Zo2sXEZhPKsYqVRy16DR31LrzqApqTDRxQX/wKO6XxGMfKRdC
         T9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798112; x=1780402912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HJn5baRVScE6xD2wHYFVG8MdWdyU6wVQsFxtKnoFAoU=;
        b=Vp6siKBdGr3iVJTXrXyCV9D/nbUVUZefcFVO4b9rg/nLgfFICNW/gIAYxv0CRQ34Ba
         yyWnIjnv3XGQsVW4rWftLkk1bWJrRR6ch+TD5hhMEIrfrcNz6GAkSS2ms1o0lv8W3bPW
         rNXnjbG/tLK8AFtfVjbAeJ8SLuDvJaINj80iHMZkxSK5vSU0BrFO1VuVV44NB1QZFbFl
         RcsQEnpnqxUUUBudENYL38c11Iw2AnuJ6rN4MQjmTkftFHrNdW+H1St/yWe9gClEpJoD
         9QmLFSxT6cAtYOy/YmbUsy6P2bGHjyM6qm9cKN1RZBr4camXDlmqMo6TKvTPNv8/6ydK
         3Y6w==
X-Forwarded-Encrypted: i=1; AFNElJ+ly/4Dd9QgfwemRnCmsGJ9jm3zojWnOX+j5IVbdisQnvD+WpNYK9I+WW+hjvMo9m8dtYcf@lists.linux.dev
X-Gm-Message-State: AOJu0YxgROBHmSRCy21wkzWx4N9MDMbzgBRjQ1Gc4QAwAfJU7wrZVAaD
	ciUCI6n9x/3HcoIX/lHl8+3iKjsanDP4/JDPMODn/6cf9CI/Q5jUshbpCvW87/fsprh5U8VecpC
	G1oqyr5j2cBWrwbA2gvyLuzhUdrHCe5Q=
X-Gm-Gg: Acq92OFqpi66kNSUAdHmLdAGWeW0S84kggMVtXS/GLhX1AVK2QOEJ/HfuA2tJwxFYUS
	VJxgG9Qoku7zCoXAFYPK+Rdrdy10E1ltKuiBu70SbXHZmx7lJIRi71dRk/Edefc9mqonTHB0Chm
	NG8We5LvVpyM/8fbP39WSuYVt2zBpoaTkADh3nhLhbTyBMtH7Erfy/sefmtrd8fscA3phe5zJ/H
	EUrKQccyR+DWTweOAgiqPAZI/xPRFC6xkRvISdDx7JJyfPyLc+pYj8/Do7yo4B8DRQG7n5XL6yl
	JA5XxBmQyc28HElsEMkTzQCaQokmqcNjhhHSANsejnWByWPS5gVJEI5UQqv+jcJlLo6eFvP1ATH
	roL0YuopFptXLwgFqL5Lbrn0=
X-Received: by 2002:a05:7301:2c89:b0:2ce:db5e:354b with SMTP id
 5a478bee46e88-3044912c779mr3837047eec.6.1779798111828; Tue, 26 May 2026
 05:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260520064630.1785283-1-mkchauras@gmail.com> <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com> <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 14:21:38 +0200
X-Gm-Features: AVHnY4JzDBCz65LWfOhQbkvjD_WZ3wkgopiTtJKdM9xbh9f_3NlkdYUpZbBQgqU
Message-ID: <CANiq72nr8AX68THHi+7u6uU=TshQGDSjT7FVRBpMRfXMz7TyHQ@mail.gmail.com>
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, fujita.tomonori@gmail.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org, 
	kees@kernel.org, lyude@redhat.com, airlied@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 10:53=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> I wanted inline asm be stable, I was skeptical about inline asm to be
> unstable and potentially messing up the whole system. That's the reason
> I waited for the stable support to get merged before sending out this
> patch series.

Yeah, sometimes unstable may mean there were remaining issues, but it
is also common for features to remain unstable for a long time without
no changes. So, yeah, we should at least try to know what is the
overall status, i.e. the latest changes that landed regarding ppc64
inline asm, e.g. when was the last time a significant bug was fixed
etc.

(And I guess IBM prefers that it works with more versions rather than less?=
)

> Yeah it may be true. I'll test out the 1.85 rustc and come back with the
> results.

Thanks, that would be great.

> I am not aware of s390x way of approaching support for rust so can't say
> anything about that.

Ah, OK -- both series added the conditional to
`scripts/min-tool-version.sh` and both are from IBM, so I was just
wondering :)

Cheers,
Miguel
