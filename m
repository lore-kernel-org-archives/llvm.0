Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A4819CC24;
	Sat, 15 Mar 2025 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742027984; cv=none; b=KsFmTIMA+9uD8Bwj5HS9GKiK0CbUDwBElsvsqLJvyglYwbVqLkBPV9TBbb9zaJinO+YnIGAlAAQMaZA4vR5iV7ezQm9Q8g9XAay3Fvj1QKlKvyvobyeCdqU+1oFW2sAObxsBaYymnnToSpUXiI7pTvffNfp/bpv5yjNvUotDngA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742027984; c=relaxed/simple;
	bh=5LqvU/cJQx/1TIRoWiOkrdkCMIi9f/CjyroRp+0LRNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KrtRKd78vsG+Py4HVy8nduPL+PBrMGD0YlBZM3pp9JA4hi135gUYJOKwMwg1gpSRDcfyj1cGu8GW1wwATVrN3u4JNnrrNKr37ePWBnnGnfAD4XkcA4e6s7STnzyU1TMUGA91Z84ceKuJVFfIQjEtVg474Bdh1CoN0dLo2wwtPl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WiDD7Y/A; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiDD7Y/A"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30144a72db9so121470a91.1;
        Sat, 15 Mar 2025 01:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742027982; x=1742632782; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zU+utGiUYn/lWu8TMh9PRW1LdrPW+WIyNxx2vVUsNOY=;
        b=WiDD7Y/AMFrEwYylbXjubXZW1TdZaVGlMnlSvtaVsh9px8vRObko/qBqcXttcKyM4+
         JpphoF267a4JAW2UHv9y27EOlECUfcetI81WQuKDeaQEzcG5lyYXQ9VcDSOaRr5VRJVc
         TfLVNBuMnLakyvcZxn+xpFa0wgL9eSR3BDCQ5IgcLcStdqbWxuRiqSq1UrQ/qy5lSjed
         kbWAjMi60Y4MPertrcwWKQ3WogmLUaghfpXtKT840ORIv6VC5WPGq4ZOp2PMgpemmqsG
         EUzgdZmQuRuQbbwzLtI0DOHz1Gy/PdqBgZnhak5QJ/UkeEVd5zA5w0tXqOC8cEd1R1/V
         YZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742027982; x=1742632782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zU+utGiUYn/lWu8TMh9PRW1LdrPW+WIyNxx2vVUsNOY=;
        b=EeX5ed3Q4UIXTOeHojHhNi+9YI/+OMFoL4uDsVBW9h4oFKnRXyxSWbdqk7od9m77zk
         IC/rWUgl/5oc0qYVGhKjB8WgNlX29gbhRG5w4le+gFwpGwYiwRjSegC6q1SivPzWV3Gc
         d6Wca1W+R4wvgoXUmt1nrT63Y9/BzW+B37fOh1f/7loD3emt1jTqW5nPL+f8JiboFvo8
         sQfpt24uR8mudYn52iDSgTCJRWCRrju68/YZRmiWEG/ALthR0iNezXaWHBOtMY4fmhX4
         UpSDqGwyxtP5eTwDZgLVRYqTXfQXT1eMHVUi9gMud9OnewwywAFbwNhCON1zIOylDtJ8
         SmvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrGk04kCIMI5HUdHvLC/RtE+QmBumJrrsAay71VsRpqaBgb6kX9S9wfW0KXzR5cUlrft5t@lists.linux.dev, AJvYcCXXqEwict0uWheRMKELPimtzqSKLeRaozuW2GrQfV3Q6NgyUKWubkt9nQNysfc8PQPy0fVCtAajSnnsi1ztyw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqbV6ftN0HXWuHnCc5JsQGYUdC7/LuCOl1tpmfUH2xq19Dpx2Z
	F2b9X9TJE8xwL0oWDQ+l6YlBfa3XbcEXs3NXfYGWZHr1DKn1AHIA1Ogt5AqrNMbWvMMMDJfh77A
	o34VkkDc8nzjmK5EzTJ/lW4E97aM=
X-Gm-Gg: ASbGncuTF/cm9BBXIn+gN29kpIGvjFQ14+hjWEOdGlvcS6v22SydEic+uJW4tuFOtGb
	bNuYLP2znsibTHxvTY7FDkLCL8DnTGLWGM2NoizPGlHTNC1GwnWX1laXR9ByaCWtmuy8od1x1Ue
	3NvUJSC0VRAmI+X0I/PIQELq0rRg==
X-Google-Smtp-Source: AGHT+IEiDB4t+c598d3Rq4swU0Mc2iQEwpq/fpeMERuc6Zu1/Nz/gU10ofBwL1zy26MHqx+aHZR0uleLUhg1IqlQRug=
X-Received: by 2002:a17:90b:3850:b0:2ff:6941:9b6a with SMTP id
 98e67ed59e1d1-30151d40343mr2609242a91.3.1742027982134; Sat, 15 Mar 2025
 01:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z9IsEPOnC+MGSAEA@rli9-mobl> <CAK7LNAQpbQCzKha63SnJG2TpyXCFB4Vu8Q9xua9G8ht=Fbk_kA@mail.gmail.com>
In-Reply-To: <CAK7LNAQpbQCzKha63SnJG2TpyXCFB4Vu8Q9xua9G8ht=Fbk_kA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 15 Mar 2025 09:39:30 +0100
X-Gm-Features: AQ5f1JoLQONECP0PuXiZH1IsoZyMhazVY9AyCX57H_XAEH9AnCNINSRLMFnffeA
Message-ID: <CANiq72md8yWAHdZeJFWAQFxb_9ftTFMiQciK+ZGf+3Lp_Jxa8g@mail.gmail.com>
Subject: Re: [masahiroy-kbuild:kbuild 15/20] error: Unrecognized option: 'remap-path-prefix'
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: kernel test robot <lkp@intel.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Miguel Ojeda <ojeda@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2025 at 8:45=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Do you see this?
>
> I tried to reproduce it on commit
> 6b5747d07138f8109b1a150830f1d138de146ac2,
> but I did not observe the reported error.

This is probably:

    https://lore.kernel.org/rust-for-linux/CANiq72ntZj10H1DBqRyX=3DuLertMw5=
9e=3DPM7ESVJ0zWfu_ECnnA@mail.gmail.com/
    https://lore.kernel.org/rust-for-linux/20250314213333.2230670-1-ojeda@k=
ernel.org/

Cheers,
Miguel
