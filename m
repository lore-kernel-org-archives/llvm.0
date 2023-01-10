Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC4C2570
	for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 07:42:22 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id w1so10776272wrt.8
        for <llvm@lists.linux.dev>; Mon, 09 Jan 2023 23:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCR/5Hx4NATrbBZTdEBXrTKuKP6muZPLwQu+AxLiao0=;
        b=ilq5vYVAKMDGVuhI6spROnL42ZmvWq3zjVfDIJQWoUWT2lonAGnLw/wViEwVaIfWJW
         4/qArhal9JNnWaxTMyv3FkH+A8YC6BeW8jfcHCKrGOktEkuMYa9XakZrYsGpQ2v4lWvY
         SCNmoUEhyeoNEcAVpVntpliqKG94OgugwXk8NePOYUPxqF4dqozNoCzGarfzOpMDooV3
         TqOu9Xumu65uOkmPZk+OQYZDFdFWk0eMTsbXVMpdckpgHqbWE4h70RaE74UdysRBjT/E
         J7oDGwVkmxWN0SBtaFPGJxz1795UaM32gfMstSKrPWDzgyYAjzy+syiOKHgEOaifqieN
         roeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCR/5Hx4NATrbBZTdEBXrTKuKP6muZPLwQu+AxLiao0=;
        b=w7nYXU2xx5n3ayXYl7tHDtqnlfeElur46MA2R3uT0EjKF19u6ugTnzqtDKdLVGUQf8
         kk5ZtV+aMWegU2fhtt4YTlCXd8x/yeesnvwp0HieBbsrJWQ7/I0kzNwt5gM9SOT8hUvQ
         VZmn8EkBRCjYII91a32E4Dv97SnPWWdCEvYDMXVP95EwnzkBfG3jNtZkKcBZcLss0Mp6
         IeCJo3B38Dxy0NoyUuh8CcJlBdioY70yjpCirLMztdGxWNkLLMN5ZxqbZhSMP+yvhkp5
         aAPGXJGXZBLLOlEhHsKJYhHy7b4ONWFmqCJgYaRT21//MOPVfZVkaLdUo8NgvtST+9RB
         Kp8w==
X-Gm-Message-State: AFqh2kp/HSXTQ6CZtg7Wg0L+b/DP8/RC4ZMudK+Wz7AbulEypah+big9
	/NtuUkctCRECiD7hAyIx2mGmOQ==
X-Google-Smtp-Source: AMrXdXuhw4Ynk4e4lsMHI3M5xmOmxfxlohSaHdYOdbO4EKcCZT6f24cAO+0bK3pqfAw3GntDd4iMPg==
X-Received: by 2002:a05:6000:a1d:b0:2bb:dcf9:482b with SMTP id co29-20020a0560000a1d00b002bbdcf9482bmr6276843wrb.47.1673336540752;
        Mon, 09 Jan 2023 23:42:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id f2-20020adfdb42000000b0024274a5db0asm10675795wrj.2.2023.01.09.23.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 23:42:20 -0800 (PST)
Message-ID: <a67ec96a-cd07-47ee-f715-0b4e29770b40@linaro.org>
Date: Tue, 10 Jan 2023 08:42:18 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 03/14] MIPS: Prefer cc-option for additions to cflags
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, masahiroy@kernel.org,
 ndesaulniers@google.com
Cc: nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-3-658cbc8fc592@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-3-658cbc8fc592@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/1/23 20:54, Nathan Chancellor wrote:
> A future change will switch as-option to use KBUILD_AFLAGS instead of
> KBUILD_CFLAGS to allow clang to drop -Qunused-arguments, which may cause
> issues if the flag being tested requires a flag previously added to
> KBUILD_CFLAGS but not KBUILD_AFLAGS. Use cc-option for cflags additions
> so that the flags are tested properly.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: tsbogend@alpha.franken.de
> Cc: linux-mips@vger.kernel.org
> ---
>   arch/mips/Makefile             | 2 +-
>   arch/mips/loongson2ef/Platform | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

