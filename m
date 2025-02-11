Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20399272904
	for <llvm@lists.linux.dev>; Tue, 11 Feb 2025 22:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739313818; cv=none; b=JMG5IhNGAq1ukXfXYpDyOLfbA4d/voL0TzAbFg/TS46WD7p+pbflxSH5b0VICxnN2diRTZvFJSKtPPPePYeSVjpeWpqp1ie927jj1rvN90Z/FpCDp8a797C00kmbSp8k/G+ZeHl7IGgW0XcET8eKYlqW4cTf68G/i9Hu0eOWH1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739313818; c=relaxed/simple;
	bh=+P0q4a0fkVM7lU5+Wd/g02zcF7Ptx6plpBHI4r4wCY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PioVW811w3mvadfUlSAHA0HkbxDmWvBJgWkoxz/WGZLeFRY0vkTW3eqOo/lZhu2kuGayKr06N3oOiYQ8AePgRGc4kvmsqub+BVlRVvc/mgKKB2skS3+zn64K09QLZ/THh5tzxWae7k7Ywuwf2RB2Z/mO0HF0UzFV1+LgJq23vBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBmSqVXs; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBmSqVXs"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30613802a6bso65239621fa.1
        for <llvm@lists.linux.dev>; Tue, 11 Feb 2025 14:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739313815; x=1739918615; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+P0q4a0fkVM7lU5+Wd/g02zcF7Ptx6plpBHI4r4wCY4=;
        b=MBmSqVXsjISrwESSzdd5hwDJcm7b8ohxm3VJweAcNSBStoiO5kTPD6FnawyLvdydPs
         qRXwZo5ef197nIyTinzEdgNpl/3Nkl1YT3gb5w9x+ay9IsSnwg4m2NdLOiTnBD6rVejG
         hO8LlcmkiiOzG3NXVAOui+nNPJxeq83hGue2wPBoy6Hkzc8wdZwB5pEXV2AXx5ChqmhT
         WvV2WiI//GD7401BM6svYXYMnGeKOZE25ySvsi8SQCtajRZzjhpoaASq9/bwO6C0IyU4
         EKEsQPn6J4+kzU8313fLJb7hJGLUy81A/Ixl1Uhv0Zaie6gRsQdUAUXPqaccKBqGzd4t
         zUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739313815; x=1739918615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+P0q4a0fkVM7lU5+Wd/g02zcF7Ptx6plpBHI4r4wCY4=;
        b=KY9+en29a24USRX+2E+uVG1bVrm5L0AMLVXLU/umHt/BUfv7xepzyzDZxIF12DayxQ
         FLRewxZGsn0qFPUAE9uiimaZIMk4Z+owagN+vNsVkkHVBf7eIsV3iXkL/eaLIsOciAjW
         S1li5UzD5JGYO74MPmnUi8ZQp94k8eOVpQzEH5vHCklSEEwDRWvTAa+FiEzF1CcaFTZE
         8TsVxFYRFbeIYFTitbIM4t6WWwuAAET4HJNQQM+le0gmY8ZkiKqH07cA06KGY3ANNvJK
         2t+Hwcfn2gTYpYiYBzCEBUUBiSwjx4VWKa/7wY+diFeXmA2wriUgD8q744KRo4hzy3he
         rcjg==
X-Forwarded-Encrypted: i=1; AJvYcCWNvwpEZDdevhO0rUwGu2pHyaeEpHyaaxsJrl7ZfDhlPiGBrJNXaTaRKmbom3BWBjsSyFVk@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ8A3nxjQVfgmls2DbQmsMwnyBJagSlF+HCCL6BzofJxCyCZbV
	dBPJnlBU2e2wOChygj9cjBBlttgHNPxxZ/jpXb47vZX/OoaYfQJ36sNoIU419jpOdiRqsr7eDUr
	jEqgw9+oyRZYCFX7nZiCGqSv1Ax4=
X-Gm-Gg: ASbGncuvph3/zURcCLztLkydWy01Wyb0OGfXyk2Ol7CuUnY4Knoff7cFUyKb680JhS3
	7yFUZb0Oba77kDy3mZNS+3uw2ip/CVo+rN4OTytW2vslOARUxVgFU3k0CxnY+xwpgpg6jpoCYrw
	8g4ZllCvsArGm6
X-Google-Smtp-Source: AGHT+IELdGNHUDK0UfZymCdzCGQppus55YE/nCQaFiA7ChFaTnW2wACEvhwP4JP61G9fF7ZueB1/JebEtHfPflOAhrg=
X-Received: by 2002:a05:651c:2205:b0:308:e8d3:7571 with SMTP id
 38308e7fff4ca-3090377bb96mr4324741fa.31.1739313815030; Tue, 11 Feb 2025
 14:43:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250210-ww_mutex-kunit-convert-v1-1-972f0201f71e@gmail.com> <Z6vRIZk7DsSNooFZ@boqun-archlinux>
In-Reply-To: <Z6vRIZk7DsSNooFZ@boqun-archlinux>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 11 Feb 2025 17:42:59 -0500
X-Gm-Features: AWEUYZmdVD87KgQWGbxD7rE2mUUzNYneLqMuLXWmOxVvy_-_F7I4uqgkp4eVj00
Message-ID: <CAJ-ks9=EfdCenpTjSdsaGhbUyJ99JYEL_nY0Y8RqzOxXKYWY5A@mail.gmail.com>
Subject: Re: [PATCH] ww_mutex: convert self-test to KUnit
To: Boqun Feng <boqun.feng@gmail.com>
Cc: David Gow <davidgow@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 5:38=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Hi Tamir,

Hi Boqun, thanks for taking a look.

> On Mon, Feb 10, 2025 at 10:59:12AM -0500, Tamir Duberstein wrote:
> > Convert this unit test to a KUnit test.
> >
>
> I would like to know the pros and cons between kunit tests and
> kselftests, maybe someone Cced can answer that? It'll be good to put
> these in the commit log as well.

David Gow gave a pretty detailed answer in
https://lore.kernel.org/all/CABVgOS=3DKZrM2dWyp1HzVS0zh7vquLxmTY2T2Ti53DQAD=
rW+sJg@mail.gmail.com/
for a similar patch.

David, what do you think about enumerating these reasons in the KUnit
documentation? This is the 3rd of these patches that has received this
question. It'd be a shame to have every commit enumerate KUnit's
reasons for being.

Tamir
