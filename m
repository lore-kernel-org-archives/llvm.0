Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF1720FE
	for <llvm@lists.linux.dev>; Mon,  7 Aug 2023 16:16:31 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3a43cbb432aso3492856b6e.3
        for <llvm@lists.linux.dev>; Mon, 07 Aug 2023 09:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691424991; x=1692029791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI9lCyYaVLODm6yBF1avYe6Q+YXmnQB4pXM9V+w2GqI=;
        b=bUItKTrEf3PRwie2sR5D13cHP88i5n1/BUWXxLBkxbK3icXEUTXSfe+cKgloaoxDZA
         1IcHvTQPchviNvqMpE3ZWNgbMAWVrHGOBzWZ6cJ/CttRvBZihByyxjmq4kpqL7RBo4lU
         Xkm844y4lwlT7Ssb/f8eM2MaLooBp89VIrCtV3FlkmsHClhzouQzNcFSzw5uf34cxBtq
         zMfvZP7obfp+OKWascCg/oIm3X06XYlG092GWY19LU0QGkdNX4jGPyCrsYpu72djj18y
         tUCY4FkxKILyLLawx+GgTsI6IVMX1yb92LCE0HpQYzuWa0UUKWIsvnBEo33p11N0qZrY
         hVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691424991; x=1692029791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CI9lCyYaVLODm6yBF1avYe6Q+YXmnQB4pXM9V+w2GqI=;
        b=FJsKcicMBR43dOk0CZQDyScK7jNnHwlcgrKbnmOb1R83Td8nzN3BR0IyrBn0f/jhN5
         6orQPdfBMJ2sITom5H1nTYO1irA/w2Z3I+EXRB1JdW9JyAN4DmA99wBONpm21og5+Hm6
         gWUAHV5N5sup0rAS5ZNPqbUBVW8DqPghzvrpHxgws+JKJc4Ao/q+C+n4txh5MFVb72sa
         ktpT4P/VpavBfegzlickwDUe98z4AIpcwDiLeOiAZ6TMRuB3+D0UWP6LI9j+JYwkpHPW
         c7M1Ev04pmfN8oR/VQE0pSP4VH8gjrqy/NHRdmMzow3r9BjENKCNIFdr0Y7uxn85zlHs
         Vq6Q==
X-Gm-Message-State: AOJu0Yyv7oO41fLjy708ctHLlhAS8BHpHdl9KF594K5Z0jHBF4v7HeEq
	3oaosJ7pSPNOUE5ea1s3snoC/CC+bjSVp1gCtLimEw==
X-Google-Smtp-Source: AGHT+IFB0XrJ8CL9e/DkqGjiBbm//FuJBQT/I0BwAypIv2vosUrZp0mjdohNdwcbYwhkCe0A3mGq2Hw60KoAMXRy+Ps=
X-Received: by 2002:a05:6358:590f:b0:130:e0a9:a7b4 with SMTP id
 g15-20020a056358590f00b00130e0a9a7b4mr9097775rwf.13.1691424990475; Mon, 07
 Aug 2023 09:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c7f1bf9b-b183-bf6e-1cbb-d43f72494083@gmail.com>
 <2023080743-amendable-moonlit-15b7@gregkh> <CAFqe=zJ9uRTVG=jny2PzUrrFGW2E_mZrGKF-3YMRkjzMUdu_7A@mail.gmail.com>
 <CAKwvOd=gJO93_eqUcR6VD8n+eqxL7-aG5D7AnAgG1ki1N1ms0g@mail.gmail.com>
In-Reply-To: <CAKwvOd=gJO93_eqUcR6VD8n+eqxL7-aG5D7AnAgG1ki1N1ms0g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Aug 2023 09:16:19 -0700
Message-ID: <CAKwvOdm-0+0PieK4KMwuGeW4Y-3+JydRMN+q9Upn5253A_QfoQ@mail.gmail.com>
Subject: Re: Fwd: CFI violation when reading amd_pstate/status
To: =?UTF-8?Q?Jannik_Gl=C3=BCckert?= <jannik.glueckert@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Huang Rui <ray.huang@amd.com>, Nathan Chancellor <nathan@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux LLVM Build Support <llvm@lists.linux.dev>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 9:15=E2=80=AFAM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Sun, Aug 6, 2023 at 11:21=E2=80=AFPM Jannik Gl=C3=BCckert
> <jannik.glueckert@gmail.com> wrote:
> >
> > Hi Greg,
> >
> > our kernel uses the Fedora config and has a homeopathic patchset on
> > top of upstream - see
> > https://gitweb.gentoo.org/proj/linux-patches.git/tree/?h=3D6.4 except
> > the 50** patches.
> > Namely we don't touch cpufreq or pm.
> >
> > > Comm: cat Tainted: P
> >
> > I am not using any out of tree modules, the kernel switches to
> > Tainted: P on the first CFI violation.
>
> Thanks for the report.
> Let's track this in
> https://github.com/ClangBuiltLinux/linux/issues/1901
> (You can use the MAINTAINERS file to see issue trackers via the `B:`
> symbol used by various parts of the tree).

Heh, while doing my morning email scrub, it looks like a patch has
already been sent (a few minutes ago):
https://lore.kernel.org/all/20230807-amd-pstate-cfi-v1-1-0263daa13bc3@weiss=
schuh.net/

>
> >
> > Regards
> > Jannik
> >
> > Am Mo., 7. Aug. 2023 um 08:03 Uhr schrieb Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>:
> > >
> > > On Mon, Aug 07, 2023 at 06:55:49AM +0700, Bagas Sanjaya wrote:
> > > > Hi,
> > > >
> > > > I notice a bug report on Bugzilla [1]. Quoting from it:
> > > >
> > > > > On kernel 6.4.7, with amd_pstate=3Dactive, with a Ryzen 7700X
> > > > > I get a Clang CFI violation when reading /sys/devices/system/cpu/=
amd_pstate/status
> > > > >
> > > > > This is reproduceable with every read, I have only tried with amd=
_pstate=3Dactive
> > > > >
> > > > > With the following CFI and Clang configs, Clang 16.0.6
> > > > > CONFIG_CFI_CLANG=3Dy
> > > > > CONFIG_CFI_PERMISSIVE=3Dy
> > > > > CONFIG_LTO_CLANG=3Dy
> > > > > CONFIG_LTO_CLANG_THIN=3Dy
> > > > >
> > > > > Below is the full call trace, let me know if you need a trace wit=
h debug info.
> > > > >
> > > > > [ 4947.849350] CFI failure at dev_attr_show+0x24/0x60 (target: sh=
ow_status+0x0/0x70; expected type: 0x8651b1de)
> > > > > [ 4947.849358] WARNING: CPU: 2 PID: 16519 at dev_attr_show+0x24/0=
x60
> > > > > [ 4947.849360] Modules linked in: binfmt_misc nf_conntrack_netbio=
s_ns nf_conntrack_broadcast wireguard curve25519_x86_64 libcurve25519_gener=
ic ip6_udp_tunnel udp_tunnel snd_seq_dummy snd_hrtimer snd_seq rfcomm joyde=
v uhid xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tftp nf_con=
ntrack_tftp nft_fib_inet nft_fib_ipv6 nft_fib_ipv4 nft_fib nft_reject_inet =
nf_reject_ipv6 nf_reject_ipv4 nft_reject nft_ct nft_chain_nat bridge 8021q =
mrp garp stp llc nf_tables ebtable_nat ebtable_broute ip6table_nat ip6table=
_mangle ip6table_raw ip6table_security iptable_nat nf_nat nf_conntrack nf_d=
efrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw iptable_security ip_se=
t nfnetlink ebtable_filter ebtables ip6table_filter ip6_tables iptable_filt=
er ip_tables bnep vfat fat amdgpu snd_hda_codec_realtek snd_hda_codec_gener=
ic snd_hda_codec_hdmi snd_hda_intel mt7921e vfio_pci intel_rapl_msr mt7921_=
common intel_rapl_common mt76_connac_lib edac_mce_amd vfio_pci_core mt76 vf=
io_iommu_type1 vfio kvm_amd iommufd iommu_v2 snd_usb_audio
> > > > > [ 4947.849379]  snd_intel_dspcfg gpu_sched snd_intel_sdw_acpi mac=
80211 drm_suballoc_helper snd_usbmidi_lib i2c_algo_bit drm_ttm_helper snd_h=
da_codec btusb ttm btrtl libarc4 btmtk snd_hda_core snd_rawmidi kvm snd_seq=
_device drm_display_helper btintel snd_hwdep mc btbcm irqbypass cfg80211 ce=
c snd_pcm asus_nb_wmi bluetooth eeepc_wmi snd_timer asus_wmi drm_kms_helper=
 ledtrig_audio sparse_keymap snd gpio_amdpt platform_profile gpio_generic d=
rm_buddy rfkill soundcore rapl i2c_piix4 wmi_bmof pcspkr k10temp lm92 nct67=
75_core hwmon_vid fuse loop dm_crypt crct10dif_pclmul polyval_clmulni polyv=
al_generic ghash_clmulni_intel nvme sp5100_tco ccp r8169 nvme_core nvme_com=
mon video wmi sunrpc
> > > > > [ 4947.849398] CPU: 2 PID: 16519 Comm: cat Tainted: P            =
       6.4.7-gentoo-dist-hardened #1
> > >
> > > Can't do much about this kernel, we don't know what's really in it,
> > > sorry.
> > >
> > > greg k-h
>
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
