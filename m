Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E82B882F
	for <llvm@lists.linux.dev>; Mon,  1 May 2023 20:43:01 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-50bc3a5f462so127a12.1
        for <llvm@lists.linux.dev>; Mon, 01 May 2023 13:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682973779; x=1685565779;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1A2MsfOVZEuiK++YzvE3jgo2ph5eAEBNJeE4uEbOkUI=;
        b=uBTWnNsfaf1l/JhsC0LFpNB4hezl72p/9PNZ2t0uCvhL+nZlD/G+6957v1IWQP9Iki
         if0lMy/8Wc9m3QBUd6I43Q2XFwgXyDQyw9Crd5Sm04PUbJ9rd6HbHtODGVGZGrMxux4v
         ZwsnGyaJRshgw49yimM+PT6HVOgVjF4y+fBMQ7lFavBgJpXpHRxMcI1kOV8ZS2vxT2c2
         TNf0+myyRGBojJaA7NKW9u0E++cfViJHE0kHJ1/rFkrRR5c4rFBtE8iEnXQMuaumGWKb
         JtqDDRDs4kTEuGhusHHcEyFq4FXbc9YhW3YweYyVgM4EXtmBdckCU180SKZ/6QK5NJ/g
         BCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682973779; x=1685565779;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1A2MsfOVZEuiK++YzvE3jgo2ph5eAEBNJeE4uEbOkUI=;
        b=BW2HE4IV84hj2AeDwDlesprorLR23wlSAHFft9W7jKabsVJPake8xwL+rlW5O/Lc3v
         GuRKH8c7dYoou+AzUiSaelbaevmSdoPtZCJswbmxXpAm551RIX55WLam4oDJVQyNiWmM
         Gm/BOJvy84fyHoAFXYCLMInpQSs6edFiBO+65IxqDS9QhIXSHT0bzgMROeEjmaKe3gtq
         wo/KIuTLjwp9gGtvIhhbNK63LPZ+qMsmoQTWikroPXQn6L425SQtZGBLBMLCN9BwUpr/
         dINdht40GfgwKBI20rdnvY9z6haBodeGsrzEQAagSBJ6U5CdIpivdMRLOT+EHQ8G4rI4
         3lGA==
X-Gm-Message-State: AC+VfDxtbwQEnjJL9PKGrFIjUcg5bxPzgvxkWmaShf4wr8pcsPvMCnvx
	eEjnor03OsV0n9rFHtvf84Qq5b8/p38hXrQd/Bbe3cbG3x5hwcY+aw==
X-Google-Smtp-Source: ACHHUZ6djo1a4sKJncxcR3YAoBK7JMPt1nQ7pgJIknNW4EMWbum/yS7zn723t9FGJwqP+NUMF4fUYOdyrszkYHCCf1U=
X-Received: by 2002:a05:6402:530e:b0:502:368:66a8 with SMTP id
 eo14-20020a056402530e00b00502036866a8mr18956edb.1.1682973779038; Mon, 01 May
 2023 13:42:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGG=3QWao2bQ0R8yzkjZQwiwGcDf2u67fztPAv09S1ixDUxYrg@mail.gmail.com>
In-Reply-To: <CAGG=3QWao2bQ0R8yzkjZQwiwGcDf2u67fztPAv09S1ixDUxYrg@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 1 May 2023 13:42:42 -0700
Message-ID: <CAGG=3QXHK2XhBBV0XwUok-Cop_+xJZtB_D1=qMS6HwWoKs8Hag@mail.gmail.com>
Subject: Fwd: [Announcement] Clang-Built Linux Meetup 2023 Dates
To: clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

We plan to hold this year's Clang-Built Linux Meetup on the 11th of
November in Richmond VA. (the Saturday before the Linux Plumbers
Conference). It'll be a time to discuss Clang-specific topics and give
people an opportunity to present their work and/or do a dry run of
their LPC talks. We'll also have hacking sessions, bug hunts, and
future planning.

Further details will be forthcoming later this month.

Share and enjoy!
-bw
