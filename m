Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E474699
	for <llvm@lists.linux.dev>; Mon, 29 Aug 2022 17:00:11 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id w8so2967480lft.12
        for <llvm@lists.linux.dev>; Mon, 29 Aug 2022 10:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=02A4WbHhB+W2fYfm07iMIj/9+1lNCqkttx9wg+WkwYM=;
        b=bXsGTsbwdgP/vC54WZaHex/xFZJpn7/Z7wIr8upxeRpyU8TcKU+wj3zySEIQ3xJ6EU
         C8LtxyUIrb68Utgo1nRaV7LVGbUn2Fi1mODUc5nOWHkV5ze41b+6lwTARX7cWSEIyjzK
         T98lsCJH9Twwnggd8q0SiexYiE+yq6Tx3Acn02yachTkkx7E5pxS344E7atvTb34TE5G
         D3WFHkacjkjn9wb+gSyAqYYkXoK7weUQjtyb59zlaGWyUf0L/wVbTl1cksx/Mn8G6q//
         1tatGff5orV3ugFh4iSaN+bP1MGeLvmrZO5ZN0SCWRv0AFb0ZweWWTtQCGnrZpeC2B+9
         HwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=02A4WbHhB+W2fYfm07iMIj/9+1lNCqkttx9wg+WkwYM=;
        b=ZfOWWahpainhyRWQXlns51oqK6lwj70nQRw5WYBJqqCIl53AE01cFngKA/wMqNkBnx
         qo/CE/tLK1IVAbP2dWilZISI9ZVzVEp6b99lZ5yhNojnfmUPcCl6yJPjlTHAzqItGGgb
         EwvBeNIBYkTglggZ8Pj76dXRLPaeznU09ObXQNI5x3qnTOVxGmBeU7rY2GRuXZZER6/n
         HJKcf+SBzz34rLIgV+MCfwaqlG+lc+nwOm98JTz+ZyfapHgAP/fnYI7P7rBUTFOLZDR4
         ijteG9xVSDHTHVojw55f8Cmn+3qtJVkx0W+A4MPXBEtDrawXeuS9ayxSff+clXySUzSn
         9pVA==
X-Gm-Message-State: ACgBeo3av24v+Ve1AaSjsmuckNcT3pRwE9swH1BRlBiiyYFN2NzQYTOK
	3S7Ts/eDhX+9EyUNd70jGZsBQ/3G/1jR8GmUTafiXQ==
X-Google-Smtp-Source: AA6agR4NJYxf+fy5Mn9QZkjYnolAuc58qjTeTxjLSQKOdfiIgdgOlEupkZ0bsFUKtc3xN2lTpEZzRgMDVkdg08KFeek=
X-Received: by 2002:a05:6512:b01:b0:48b:a065:2a8b with SMTP id
 w1-20020a0565120b0100b0048ba0652a8bmr6207623lfu.401.1661792409139; Mon, 29
 Aug 2022 10:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220828192920.805253-3-lkml@vorpal.se> <202208290605.gE9IGbxE-lkp@intel.com>
In-Reply-To: <202208290605.gE9IGbxE-lkp@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 29 Aug 2022 09:59:57 -0700
Message-ID: <CAKwvOdmm8c30fky5GjFbLPhrfAEsO7SgehRYip-PAKr-zonEmA@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform/x86: Battery charge mode in toshiba_acpi (sysfs)
To: kernel test robot <lkp@intel.com>
Cc: Arvid Norlander <lkml@vorpal.se>, platform-driver-x86@vger.kernel.org, 
	linux-pm@vger.kernel.org, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Sebastian Reichel <sre@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Azael Avalos <coproscefalo@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 28, 2022 at 3:16 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Arvid,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on 1c23f9e627a7b412978b4e852793c5e3c3efc555]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Arvid-Norlander/platform-x86-Battery-charge-mode-in-toshiba_acpi/20220829-033110
> base:   1c23f9e627a7b412978b4e852793c5e3c3efc555
> config: x86_64-randconfig-a014-20220829 (https://download.01.org/0day-ci/archive/20220829/202208290605.gE9IGbxE-lkp@intel.com/config)

Note: this was from a randconfig; it's highly likely you need this
funky config to repro.  ^ should be the link to the config.

-- 
Thanks,
~Nick Desaulniers
