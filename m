Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF822820C6
	for <llvm@lists.linux.dev>; Mon, 29 Jun 2026 04:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782709055; cv=none; b=I397flx7sL2lb1V80GWkzQ4pZP0dvBEtUW7LI5TP+Kb2shqARHWr4ckmpeJWAu3lt6qaIr/+UaQrPAeB3fvx3dPBcx3YTgF15iPlrhazwXVaSc5jzg0J0Qed7yO3/CG0pzfLUo5i9VUgEdLjmA26q/rCl9f5mSZeZ6agcORINEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782709055; c=relaxed/simple;
	bh=7ZcDPOPqqkFXd1DkSIusAok4l3dIR7MVGZ1CdQ4xmyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEGiQPlcaTqE1bKLNL59ais+1SxLG8OtnKm4Y473QWUMHtJxc4KPpU/TIU+8WVCeai9InpBgWY8I9NakP0FQy4F7xb1BTHAMfXvvr+t7R9k9vLlN25Uv9U2v6JhAMtJOqEhc6Ctfid6wB1OuNcNCSguRiNxsoblnNph9a1yh72E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHCAFRoY; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHCAFRoY"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30b6dad2382so5494529eec.0
        for <llvm@lists.linux.dev>; Sun, 28 Jun 2026 21:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782709054; x=1783313854; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iQD/rHZj3a8p2S8n+F8bG5yMjsLxWvoQVhtFef2fXlQ=;
        b=SHCAFRoYgiBA3san4aYKeXna91YXqEiNqxLGgvsrgp/oWSEf+XP5UH5BtTnofvRMCu
         5b7PJZWknvZ0rg4h5u6uqERUeE2V7kahzg0gibV934KDDI9EJcJ08A3V7zu8svCgkefs
         ntKowc7WdiwK6hIuBY+Mz1IzePp4IYsp8R7HEYlrrYrHgjtHsTZefFRD3v6vArnqZEHQ
         +sOPTHnC5ovAQMN1gjmbnOMu7LWFiyqTwiinu5vwxC1bCgUzoKU5vuRPBKpcAyU4pSLU
         enLr87QUv572oPQzGd7WQHhZGsGsgSgg5aRwiDDywwvSyrTqQXxGJREFJWn8ArA39gz3
         T6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782709054; x=1783313854;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQD/rHZj3a8p2S8n+F8bG5yMjsLxWvoQVhtFef2fXlQ=;
        b=FWENFJviaTJcK/HMhfsTs9EqKT3KqZ3ePKdwrt9HO/8df9wka/TyjADEa1iP6uxGmu
         3a6XGHHKnRtwdm5WL1FRZ7uK6R5S0p/86kdJ6wfzfjMJAYT7ZkuF6VLGB91AJNGR+rj1
         a4+2XasS+zUxJ2K6urnhmZ9UDh+PjTazJQi+jhUt2xIEvbjAg5Zued4KIHdsO/OAVm/q
         TzFR8pXpZvl3mR2+igHsddW2dsIHxBOpyC741NNAmHe4NgrgG8TYKQ2s7k2mNakBxasg
         /ddiXXYjbqgx2LOhPsjzn4Z4JU2Fnc4Tb10OPCavbgx/xRi3PSmYuuC9t2FV41EkflYg
         ESBg==
X-Forwarded-Encrypted: i=1; AHgh+Ros445ChDb/51g5zerRY7yObgM3eywj4t3VUmdIQsU1w/Uo7IBHCXQjBTG6heD8V8346YxO@lists.linux.dev
X-Gm-Message-State: AOJu0YyR4oK0LxkJ8Mj9975wlFcnAMMFwh6tnkpQIH3kvepblhrXV/ap
	vUtLdfP5d9W2Rtm6mpp9/yEavGrgHW14MoK9kyq0cpseEWnsbW/2b6OM
X-Gm-Gg: AfdE7cn+pc1OgCsBXABblVTUrZTM5CV3TIH65/SCsGj5fFcfk6BT0Yytlzk1thRc5G7
	OehqOGGKMbQomBZsrg/YbJRhmeT4YCBG/9vA2/gtcgssoEDPm5z0CRM+a9E/kOFTljuUVs+kMWL
	b8A65Mbbhj+NW6QlJew2vhkm/jvFYhVXnxGKa0F/IGOmM9H44cm2qJq5kXkUy2u/RHRWu3VM1GF
	aDjz9ZBQrbLPmTRoiC7qRfLTbSGMRqS/X1Jn3b7ivnWBO3ADC5Dekzs/+igAGVlxFKipHfECK7k
	h4ixLMwnJFhKxrUJGjOCKiR6kfO+tf0AmEL0+iKtZVeGmvd2nLDIToBTnNfyo0VF/eS45aIdzYV
	VTGK1c+SV8qZPim6QWoDwk0P+QA116a81mgxWqeI+RZT/BRMQaKYNOvPzUGvoOWjQ+mACZoMme7
	pZpTMSkE5qulToDnVKPetWpjwBjXWNERwM5Q0ugL38RQcr/wvVkoCEaGK8762spnCyLXvS+7U=
X-Received: by 2002:a05:7300:e8a9:b0:304:bce8:fa30 with SMTP id 5a478bee46e88-30c84b2c0c8mr15331021eec.5.1782709053542;
        Sun, 28 Jun 2026 21:57:33 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca87caasm39851291eec.27.2026.06.28.21.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:57:33 -0700 (PDT)
Date: Mon, 29 Jun 2026 10:27:19 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, fujita.tomonori@gmail.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org, kees@kernel.org, 
	lyude@redhat.com, airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
Message-ID: <akH6yuDH9ZwXVoVA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
 <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com>

On Fri, Jun 26, 2026 at 12:17:50PM +0200, Miguel Ojeda wrote:
> On Fri, Jun 26, 2026 at 8:50 AM Mukesh Kumar Chaurasiya
> <mkchauras@gmail.com> wrote:
> >
> > This corresponds to a floating point instruction. Although we have
> > disabled fpu, vsx and altivec we are still generating these. Seems like
> > we have some issue with the rustc here. I didn't dive deeper into this.
> >
> > Is it ok if we keep 1.95 as base for powerpc64le?
> 
> It may be that it is generated but unused (we have that issue
> elsewhere -- see e.g. `rust/compiler_builtins.rs`).
> 
> Having said that, if 1.95 is fine for the powerpc arch maintainers,
> then that is fine (s390 also used a higher minimum -- please see the
> recent change in `scripts/min-tool-version.sh`).
> 
> But please try to bisect upstream Rust to see where the change
> happened, i.e. what is the root cause? e.g. `core` changes, `rustc`
> changes, built-in LLVM changes... It could be that it is not tied to
> the `rustc` version but LLVM's.
> 
> Cheers,
> Miguel
Hey Miguel, 

Sure i'll bisect. Meanwhile i would still like to get this upstream.

Hey @Madhavan,

Can we pick this version up for ppc?

Regards,
Mukesh
