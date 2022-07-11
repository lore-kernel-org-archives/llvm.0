Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155174420
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 18:19:35 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id y3so7679600qtv.5
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 11:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=e6nsFOxZnzPb9Fg1eVEUYJR+YSdsd9tr+jTyGytdjgk=;
        b=hixRA94QJlnFy6oD28fznNLUmKLxYaMovgs+rkwhe9Q4kwVJFHUs6nRXwpxGXR3g5S
         a3i3Qunf2o9loKGAaKP8bODyDHKyqO+8/lmm2MUIF/w4LDQKSdrYfwUUeGuV2NoSNksE
         9jVvxO0LD4nN5ueoG3+K8SDGPTqc0Mw/yPtOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=e6nsFOxZnzPb9Fg1eVEUYJR+YSdsd9tr+jTyGytdjgk=;
        b=rUlZVocbLW5RdHz4OgmzN4RB1TUMPena/HI8ocecWNkD2tPIalIrsMX7uWt7PlBeIH
         ODKsB4i5imn5qvw9M+g1Trasrjmv3t8te+IvYyDKUVVU5I0a+yTDGt+kNcTQavI9TsMg
         DbWR/niZE6+FHyRq6Gp1jS3GxzuxS9Jm/A6nE76ipNVHPX/Woe1HRwhnPerfx1C7wn1f
         a5Om6bBHGPC1Ysvb2eIM33+q3jYSIPj5ynzIc9J08esity3TWFHNRVCZJSlfxFJxBcsb
         8gDShe9IzbXUVBtAaQeqRCJMMvFrUQa2szrlqfWS/lqi82qc2paD4LM6a8qU+IbFhZ7e
         i9ng==
X-Gm-Message-State: AJIora8sZKyI4i4HqQ+eVCUJeXyD8kUnp7sokLQSffw91MO0vp5mW04O
	bA/d1BAmZjKw7nPhkk+lDBLJ6g==
X-Google-Smtp-Source: AGRyM1vflDx9HvWERfjB8kjC3JSmSBi3Bpo+ts1BGakRNUmrDwK+VCNbX6CUmO+UCyh08bHwdhVjig==
X-Received: by 2002:ac8:5a91:0:b0:31e:a602:a189 with SMTP id c17-20020ac85a91000000b0031ea602a189mr14037334qtc.552.1657563574845;
        Mon, 11 Jul 2022 11:19:34 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id w4-20020a05620a424400b006aedb35d8a1sm7325234qko.74.2022.07.11.11.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 11:19:34 -0700 (PDT)
Date: Mon, 11 Jul 2022 14:19:33 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: postmaster@kernel.org, clang-built-linux <llvm@lists.linux.dev>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [sysadmin] Fwd: Bouncing messages from llvm@lists.linux.dev
Message-ID: <20220711181933.rcukzsnabiiowy7p@meerkat.local>
References: <1657492202-18435-mlmmj-51d729a7@lists.linux.dev>
 <CAFP8O3+Lw0wKfWY-VA+tuAnVcjyN17E=yk6-VU5WcWG1xdH+UA@mail.gmail.com>
 <CAKwvOd=u=77MQwFeyaBbc2T0JXSESKRDNrFtiaTTuRcm6K1BPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=u=77MQwFeyaBbc2T0JXSESKRDNrFtiaTTuRcm6K1BPg@mail.gmail.com>

On Mon, Jul 11, 2022 at 10:54:34AM -0700, 'Nick Desaulniers' via Systems Administrators wrote:
> Hi Post Master,
> Any idea what's up with the below message?
> 
> To Fangrui, it sounded like his patch wasn't delivered to our list but
> the message Fangrui sent was indeed posted.
> https://lore.kernel.org/llvm/20220710071117.446112-1-maskray@google.com/
> 
> Can the error be reworded possibly to elucidate what's going on?

This happens in a rare case when we mistakenly allow a spam message through,
which is this one:

https://lore.kernel.org/llvm/0.0.3.735.1D894A7973BDB9A.0@absceraw.gazzettait.com/

when we tried to deliver this message to maskray@google.com, Google's spam
filters rejected it, so we got back a bounce. When this happens, mlmmj follows
up with a probe email to make sure the address is still valid, which is the
message you received.

This behaviour is indeed a bit confusing, but it's not about the mail you sent
out, just the spam your MX refused to receive.

HTH,
Konstantin

> 
> ---------- Forwarded message ---------
> From: Fangrui Song <maskray@google.com>
> Date: Mon, Jul 11, 2022 at 10:36 AM
> Subject: Fwd: Bouncing messages from llvm@lists.linux.dev
> To: Nick Desaulniers <ndesaulniers@google.com>
> 
> 
> ---------- Forwarded message ---------
> From: <llvm+owner@lists.linux.dev>
> Date: Sun, Jul 10, 2022 at 3:30 PM
> Subject: Bouncing messages from llvm@lists.linux.dev
> To: <maskray@google.com>
> 
> 
> Greetings!
> 
> This is the mlmmj program managing the <llvm@lists.linux.dev> mailing list.
> 
> Some messages to you could not be delivered. If you're seeing this
> message it means things are back to normal, and it's merely for your
> information.
> 
> Here is the list of the bounced messages:
> - 11406
> 
> 
> 
> 
> --
> 宋方睿
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
