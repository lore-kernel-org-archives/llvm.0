Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C0D3454D
	for <llvm@lists.linux.dev>; Mon, 27 Nov 2023 15:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="hNYP9Z/0"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5cfa65de9ecso15343937b3.2
        for <llvm@lists.linux.dev>; Mon, 27 Nov 2023 07:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1701100141; x=1701704941; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OZ/zaPHTOHquaBYH+lbkY1d97Oatm6ySFdaXiL8Dhc=;
        b=hNYP9Z/0b9LntXRp4YI+UbOz0pijJydvm1W8wvxvCNmx79pzapZqYAttcZyzOW8lKv
         tTP2DCEcHAuQGopzV2K3GMuBcIG5WFrZsGiXvrPanBaLHCfvbmLjeeqEUJzeaqjcykz7
         k3EkqAm/b65a8e5LVC6G3BKmAp7doVL/z83RoKtXf2RrGZuVM7B+tbLpnHkMTtLdY7dJ
         Z2oIv5bTCrScc/TYw8uT2wdZQfoABwcHto9ScNBfnPpQFU9dSSNQwsr8aUmtLIHTj19w
         2UAh/cTi/gpXzIjTvjoiB0otS7tCh4f52d2lvgPwZnMuExbvOw3xCqUtNxXa2O6dTYC6
         7SLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701100141; x=1701704941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OZ/zaPHTOHquaBYH+lbkY1d97Oatm6ySFdaXiL8Dhc=;
        b=uhFCxX4MhcTlteJ1KXclj2TPgbh/PeeErQSKO+ap+IM+AxSCUBD37nOLqapZoPRlTP
         yfFM2fGxoA1tcGzCLGV0n9MoW91QHi290hyhBPs1B7C0C9Yc5TPGBKhtvmAsemeLomkc
         OrW660u/dwHqVEOvEwA92MmxdfoAm+5JRpu3+cL1kL6pWsK9ujy6OSVx2yptc4Qkrp35
         meikVwjzl5cGDv0XmPVvpQ4lIFGddYesDDzJBQJsrty3kFA6Ux2H62QIaRmUdy+g+V02
         H/trK1APlYyCABTTWIqz0oAL4TdJkRy/tbxZQJr/2sWglWzD6pXMESrg8gz2u7icebxB
         y5SQ==
X-Gm-Message-State: AOJu0Yx4LPA92fS5jKsscWjyXIYD+S/Jt30ux6rudg326F1yEK/UfLhh
	8kpHp3hK1cBoY9xce24AjVf0sUimjMbO0qRNqQqPwg==
X-Google-Smtp-Source: AGHT+IFlXI+XiNqcLAO9Li2OL/ymYfkxPzPfv7uyjeBxX3DjN83glydtRLaPL6pFsqlmWBZulq3Mf1wcsj0hqhBji2o=
X-Received: by 2002:a81:5c05:0:b0:5ce:4dfb:bce8 with SMTP id
 q5-20020a815c05000000b005ce4dfbbce8mr11984339ywb.7.1701100140920; Mon, 27 Nov
 2023 07:49:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231124154248.315470-1-pctammela@mojatatu.com>
In-Reply-To: <20231124154248.315470-1-pctammela@mojatatu.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Mon, 27 Nov 2023 10:48:49 -0500
Message-ID: <CAM0EoMmcPw85tQCMkg6XiMA2B3b8bkLS2TVCvxC_jrwVcdNJVw@mail.gmail.com>
Subject: Re: [PATCH net-next 0/5] selftests: tc-testing: updates and cleanups
 for tdc
To: Pedro Tammela <pctammela@mojatatu.com>
Cc: netdev@vger.kernel.org, xiyou.wangcong@gmail.com, jiri@resnulli.us, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, edumazet@google.com, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 10:43=E2=80=AFAM Pedro Tammela <pctammela@mojatatu.=
com> wrote:
>
> Address the recommendations from the previous series and cleanup some
> leftovers.
>
> Pedro Tammela (5):
>   selftests: tc-testing: remove buildebpf plugin
>   selftests: tc-testing: remove unnecessary time.sleep
>   selftests: tc-testing: prefix iproute2 functions with "ipr2"
>   selftests: tc-testing: cleanup on Ctrl-C
>   selftests: tc-testing: remove unused import
>
>  tools/testing/selftests/tc-testing/Makefile   |  29 +-------
>  tools/testing/selftests/tc-testing/README     |   2 -
>  .../testing/selftests/tc-testing/action-ebpf  | Bin 0 -> 856 bytes
>  .../tc-testing/plugin-lib/buildebpfPlugin.py  |  67 ------------------
>  .../tc-testing/plugin-lib/nsPlugin.py         |  20 +++---
>  .../tc-testing/tc-tests/actions/bpf.json      |  14 ++--
>  .../tc-testing/tc-tests/filters/bpf.json      |  10 ++-
>  tools/testing/selftests/tc-testing/tdc.py     |  11 ++-
>  tools/testing/selftests/tc-testing/tdc.sh     |   2 +-
>  9 files changed, 25 insertions(+), 130 deletions(-)
>  create mode 100644 tools/testing/selftests/tc-testing/action-ebpf
>  delete mode 100644 tools/testing/selftests/tc-testing/plugin-lib/buildeb=
pfPlugin.py

For the patch series:
Acked-by: Jamal Hadi Salim <jhs@mojatatu.com>

cheers,
jamal

> --
> 2.40.1
>
