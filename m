Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDD77E
	for <llvm@lists.linux.dev>; Wed, 23 Nov 2022 14:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD86C4347C
	for <llvm@lists.linux.dev>; Wed, 23 Nov 2022 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669213988;
	bh=DNznwhHONJufkLNZpLKNvqDpPV1Ij4Mx/vGWHZOPeIg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EIPmfLJUisrkKvHe2iXo90ZexYgcz9YRxZ5hujwxkEOBzqpfrOl0slvAaPLtmeW/Q
	 s0Pe1Hc/CZg+Bm47ytXRZ3qjsssILr4ZaBCHYGXcdAIhV7NLVbr3U7PgjcWTPwVmgp
	 ifqVcob7YblDcx8JdyzVFmj3YX3sWhY3BLOoPehaSM71z01V4Yk8wxTWYHuhVXSa9S
	 lA9WhlQVDzeu838yzpS7gVQog/yah5NrGoABAo/pRv+WPtcSwOY8MuoDruw+8yZN28
	 pZm87NpjmOgdkchVZEQAz0k/5G3FhSOF6LxL6BWZ0L9WEZYr9KrjCbWzY+evPscEBE
	 wTP4dH6aB15uA==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-3691e040abaso176006817b3.9
        for <llvm@lists.linux.dev>; Wed, 23 Nov 2022 06:33:08 -0800 (PST)
X-Gm-Message-State: ANoB5pldZq3w4Ja4RbuIkBHJ7VSRGHDjSmmrdBomWDOnjl3GDxZNAjLp
	66lMrrSzJzSlfwFCYo7OtFjNV9FpydTqv/8SqFw=
X-Google-Smtp-Source: AA0mqf528dbACy5MPaO6kowlGrU/IPBlyMm2GRODCjj7QCP1NDH1c23yv+yf1nivorEacclKYJ8ZO7+2q/eUX43qiNQ=
X-Received: by 2002:a0d:c542:0:b0:370:2d8c:8193 with SMTP id
 h63-20020a0dc542000000b003702d8c8193mr8500076ywd.221.1669213987310; Wed, 23
 Nov 2022 06:33:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221123085640.103084-1-marpagan@redhat.com>
In-Reply-To: <20221123085640.103084-1-marpagan@redhat.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Wed, 23 Nov 2022 16:32:41 +0200
X-Gmail-Original-Message-ID: <CAFCwf12yeyMb3WgCPqb8sFUk5PmzrXU=sCf3oWG9FKdCCS_S1w@mail.gmail.com>
Message-ID: <CAFCwf12yeyMb3WgCPqb8sFUk5PmzrXU=sCf3oWG9FKdCCS_S1w@mail.gmail.com>
Subject: Re: [PATCH] habanalabs/gaudi2: added memset for the cq_size register
To: Marco Pagani <marpagan@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 23, 2022 at 10:59 AM Marco Pagani <marpagan@redhat.com> wrote:
>
> The clang-analyzer reported a warning: "Value stored to
> 'cq_size_addr' is never read".
>
> The cq_size register of dcore0 is not being zeroed using
> gaudi2_memset_device_lbw(), along with the other cq_* registers,
> even though the corresponding cq_size_addr variable is set.
>
> Signed-off-by: Marco Pagani <marpagan@redhat.com>
> ---
>  drivers/misc/habanalabs/gaudi2/gaudi2.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2.c b/drivers/misc/habanalabs/gaudi2/gaudi2.c
> index 65e6cae6100a..05f30adefb32 100644
> --- a/drivers/misc/habanalabs/gaudi2/gaudi2.c
> +++ b/drivers/misc/habanalabs/gaudi2/gaudi2.c
> @@ -9165,6 +9165,7 @@ static void gaudi2_restore_user_sm_registers(struct hl_device *hdev)
>         gaudi2_memset_device_lbw(hdev, cq_lbw_data_addr, size, 0);
>         gaudi2_memset_device_lbw(hdev, cq_base_l_addr, size, 0);
>         gaudi2_memset_device_lbw(hdev, cq_base_h_addr, size, 0);
> +       gaudi2_memset_device_lbw(hdev, cq_size_addr, size, 0);
>
>         cq_lbw_l_addr = mmDCORE0_SYNC_MNGR_GLBL_LBW_ADDR_L_0 + DCORE_OFFSET;
>         cq_lbw_h_addr = mmDCORE0_SYNC_MNGR_GLBL_LBW_ADDR_H_0 + DCORE_OFFSET;
> --
> 2.38.1
>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Applied to -next.
Thanks,
Oded
