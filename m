Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9842CA1
	for <llvm@lists.linux.dev>; Fri, 10 Dec 2021 19:32:56 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id cf39so7765464lfb.8
        for <llvm@lists.linux.dev>; Fri, 10 Dec 2021 11:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=16vBrnrnLm/KrdSkDqkkNxS0xymKNayV9NN0QHH9Fsc=;
        b=Fc16dXw7QrcrWym6s0uO3FUlkAd4uNZUZrWupNfe7G2/CR/8Yl570W2sz91fC34oEo
         A7iSCYIityuJlPftUpYO1kCLgwJpyP8uR0AoZdJxVM1AUwsAuQB2fZii12OInz4H5e+X
         soS/WQ6Pfl6KwacAVi9hiM9vJsOBiheOBKkNBFz3hpIQSpYRqz7a2Kt65q6oxfcFFmFo
         dIitB01qrAc1hS4i5DJuLYgrRIBlNg7c6POSBsYCTGByiarvRQEEJccD3c901j+vS4wA
         ffF/lNG9tDuAPV9taCSFHXSUnkuRHSNpDotI+gbNd2ruK02Vax+OLd6B7mzg22FyN1hD
         StAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=16vBrnrnLm/KrdSkDqkkNxS0xymKNayV9NN0QHH9Fsc=;
        b=O0kWJwP5ys1OnWO8Gpx3cKGXLIDdekqbtzoW+BJla7iKfFIs2QwmWP7WG5uhnojf6o
         7hO/88AaxIVMxbfikLA1lvdUOlHSAw59Pp/DKdmsdblocWKpBl3ie2fdZ2hjjK8059/s
         Ha4Tgc5gpfkSCfmwc7ZgtnGu51kd3hmdvH9zFGO/xsiVu4H3O6jwQXbDZyNs8qf3HzNn
         wblEN/Sdr8O2eWdoMQaX4pu6zjrmEgqgqtNtZDIB+4l/C7dOTWBVYEhm1GqfzzE8JDfF
         3DtbU1XX0zO+UN+vSKtbiU6eD0y9ml+du1uIMM5V6zAiWvMcEe1a3Ay4TVpOPOYPO/fN
         wDJA==
X-Gm-Message-State: AOAM530+pgkzAAGyQB6zIwaosc+291L/eQ39G1V/RnoBFTKLNfzmdyXJ
	yG7zhfy5k/raB8qlFbagXTWpReGsPAiDKXYtb5O9kgJNWMc=
X-Google-Smtp-Source: ABdhPJxF3+fnmbuK2XdBNyM0bI0+qKHJ0qxHxOEv72SG10GFXigVk57qhPNNilvsV+RXMaejOkWh09XKp2X17SEkv20=
X-Received: by 2002:ac2:4d19:: with SMTP id r25mr13865559lfi.82.1639164774486;
 Fri, 10 Dec 2021 11:32:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211209195141.1165233-1-nathan@kernel.org>
In-Reply-To: <20211209195141.1165233-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 10 Dec 2021 11:32:42 -0800
Message-ID: <CAKwvOdmKUsQc7UoxzqPvsH+FqxvxHGd43N9dDiYn1T31gZ94Sg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: greybus: fix stack size warning with UBSAN
To: Nathan Chancellor <nathan@kernel.org>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 9, 2021 at 11:52 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang warns about excessive stack usage in this driver when
> UBSAN is enabled:
>
> drivers/staging/greybus/audio_topology.c:977:12: error: stack frame size of 1836 bytes in function 'gbaudio_tplg_create_widget' [-Werror,-Wframe-larger-than=]
>
> Rework this code to no longer use compound literals for
> initializing the structure in each case, but instead keep
> the common bits in a preallocated constant array and copy
> them as needed.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1535
> Link: https://lore.kernel.org/r/20210103223541.2790855-1-arnd@kernel.org/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> [nathan: Address review comments from v1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for helping to get this across the finish line.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> v1 -> v2: https://lore.kernel.org/r/20210103223541.2790855-1-arnd@kernel.org/
>
> * Use NULL for name field in SND_DOC_DAPM_* in gbaudio_widgets (Alex).
>
> * Do not eliminate *dw assignment within the switch cases, as invalid
>   enum values in-between valid enum values (such as snd_soc_dapm_demux)
>   would not be handled properly by the "if value is greater than the
>   array size" check (Alex). This addresses a few other comments by Alex
>   and Dan because w->type is not checked against the array's size.
>
> Arnd, if you disagree with this approach, please let me know so that we
> can get this fixed in a way that everyone is happy with.
>
>  drivers/staging/greybus/audio_topology.c | 92 ++++++++++++------------
>  1 file changed, 45 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 1e613d42d823..7f7d558b76d0 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -974,6 +974,44 @@ static int gbaudio_widget_event(struct snd_soc_dapm_widget *w,
>         return ret;
>  }
>
> +static const struct snd_soc_dapm_widget gbaudio_widgets[] = {
> +       [snd_soc_dapm_spk]      = SND_SOC_DAPM_SPK(NULL, gbcodec_event_spk),
> +       [snd_soc_dapm_hp]       = SND_SOC_DAPM_HP(NULL, gbcodec_event_hp),
> +       [snd_soc_dapm_mic]      = SND_SOC_DAPM_MIC(NULL, gbcodec_event_int_mic),
> +       [snd_soc_dapm_output]   = SND_SOC_DAPM_OUTPUT(NULL),
> +       [snd_soc_dapm_input]    = SND_SOC_DAPM_INPUT(NULL),
> +       [snd_soc_dapm_switch]   = SND_SOC_DAPM_SWITCH_E(NULL, SND_SOC_NOPM,
> +                                       0, 0, NULL,
> +                                       gbaudio_widget_event,
> +                                       SND_SOC_DAPM_PRE_PMU |
> +                                       SND_SOC_DAPM_POST_PMD),
> +       [snd_soc_dapm_pga]      = SND_SOC_DAPM_PGA_E(NULL, SND_SOC_NOPM,
> +                                       0, 0, NULL, 0,
> +                                       gbaudio_widget_event,
> +                                       SND_SOC_DAPM_PRE_PMU |
> +                                       SND_SOC_DAPM_POST_PMD),
> +       [snd_soc_dapm_mixer]    = SND_SOC_DAPM_MIXER_E(NULL, SND_SOC_NOPM,
> +                                       0, 0, NULL, 0,
> +                                       gbaudio_widget_event,
> +                                       SND_SOC_DAPM_PRE_PMU |
> +                                       SND_SOC_DAPM_POST_PMD),
> +       [snd_soc_dapm_mux]      = SND_SOC_DAPM_MUX_E(NULL, SND_SOC_NOPM,
> +                                       0, 0, NULL,
> +                                       gbaudio_widget_event,
> +                                       SND_SOC_DAPM_PRE_PMU |
> +                                       SND_SOC_DAPM_POST_PMD),
> +       [snd_soc_dapm_aif_in]   = SND_SOC_DAPM_AIF_IN_E(NULL, NULL, 0,
> +                                       SND_SOC_NOPM, 0, 0,
> +                                       gbaudio_widget_event,
> +                                       SND_SOC_DAPM_PRE_PMU |
> +                                       SND_SOC_DAPM_POST_PMD),
> +       [snd_soc_dapm_aif_out]  = SND_SOC_DAPM_AIF_OUT_E(NULL, NULL, 0,
> +                                       SND_SOC_NOPM, 0, 0,
> +                                       gbaudio_widget_event,
> +                                       SND_SOC_DAPM_PRE_PMU |
> +                                       SND_SOC_DAPM_POST_PMD),
> +};
> +
>  static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>                                       struct snd_soc_dapm_widget *dw,
>                                       struct gb_audio_widget *w, int *w_size)
> @@ -1052,77 +1090,37 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>
>         switch (w->type) {
>         case snd_soc_dapm_spk:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_SPK(w->name, gbcodec_event_spk);
> +               *dw = gbaudio_widgets[w->type];
>                 module->op_devices |= GBAUDIO_DEVICE_OUT_SPEAKER;
>                 break;
>         case snd_soc_dapm_hp:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_HP(w->name, gbcodec_event_hp);
> +               *dw = gbaudio_widgets[w->type];
>                 module->op_devices |= (GBAUDIO_DEVICE_OUT_WIRED_HEADSET
>                                         | GBAUDIO_DEVICE_OUT_WIRED_HEADPHONE);
>                 module->ip_devices |= GBAUDIO_DEVICE_IN_WIRED_HEADSET;
>                 break;
>         case snd_soc_dapm_mic:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_MIC(w->name, gbcodec_event_int_mic);
> +               *dw = gbaudio_widgets[w->type];
>                 module->ip_devices |= GBAUDIO_DEVICE_IN_BUILTIN_MIC;
>                 break;
>         case snd_soc_dapm_output:
> -               *dw = (struct snd_soc_dapm_widget)SND_SOC_DAPM_OUTPUT(w->name);
> -               break;
>         case snd_soc_dapm_input:
> -               *dw = (struct snd_soc_dapm_widget)SND_SOC_DAPM_INPUT(w->name);
> -               break;
>         case snd_soc_dapm_switch:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_SWITCH_E(w->name, SND_SOC_NOPM, 0, 0,
> -                                             widget_kctls,
> -                                             gbaudio_widget_event,
> -                                             SND_SOC_DAPM_PRE_PMU |
> -                                             SND_SOC_DAPM_POST_PMD);
> -               break;
>         case snd_soc_dapm_pga:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_PGA_E(w->name, SND_SOC_NOPM, 0, 0, NULL, 0,
> -                                          gbaudio_widget_event,
> -                                          SND_SOC_DAPM_PRE_PMU |
> -                                          SND_SOC_DAPM_POST_PMD);
> -               break;
>         case snd_soc_dapm_mixer:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_MIXER_E(w->name, SND_SOC_NOPM, 0, 0, NULL,
> -                                            0, gbaudio_widget_event,
> -                                            SND_SOC_DAPM_PRE_PMU |
> -                                            SND_SOC_DAPM_POST_PMD);
> -               break;
>         case snd_soc_dapm_mux:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_MUX_E(w->name, SND_SOC_NOPM, 0, 0,
> -                                          widget_kctls, gbaudio_widget_event,
> -                                          SND_SOC_DAPM_PRE_PMU |
> -                                          SND_SOC_DAPM_POST_PMD);
> +               *dw = gbaudio_widgets[w->type];
>                 break;
>         case snd_soc_dapm_aif_in:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_AIF_IN_E(w->name, w->sname, 0,
> -                                             SND_SOC_NOPM,
> -                                             0, 0, gbaudio_widget_event,
> -                                             SND_SOC_DAPM_PRE_PMU |
> -                                             SND_SOC_DAPM_POST_PMD);
> -               break;
>         case snd_soc_dapm_aif_out:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_AIF_OUT_E(w->name, w->sname, 0,
> -                                              SND_SOC_NOPM,
> -                                              0, 0, gbaudio_widget_event,
> -                                              SND_SOC_DAPM_PRE_PMU |
> -                                              SND_SOC_DAPM_POST_PMD);
> +               *dw = gbaudio_widgets[w->type];
> +               dw->sname = w->sname;
>                 break;
>         default:
>                 ret = -EINVAL;
>                 goto error;
>         }
> +       dw->name = w->name;
>
>         dev_dbg(module->dev, "%s: widget of type %d created\n", dw->name,
>                 dw->id);
>
> base-commit: 42eb8fdac2fc5d62392dcfcf0253753e821a97b0
> --
> 2.34.1
>
>


-- 
Thanks,
~Nick Desaulniers
