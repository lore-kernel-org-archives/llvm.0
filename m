Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA9F3C35
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 11:40:08 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id k9so1448108wri.0
        for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 04:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc;
        bh=39duid3ev/LklZ+L3Q00JhOed86Qz5pMIsoTXShBt20=;
        b=aYZUv7/DTyZT2pKIFoyT0w8jIQNcI+zpJ0aMVwE8I04L9AcMtzi9f+rT7QaNFYhmwA
         qd4IDfpMSEeydsN8bgWSL801fnfmEHBYegk/xVQXL0n6W6GmX+0mW7/XmCfU+377t6mv
         ylqKwyDxd5j7PU0bFcHN3RL2c5J8+j7JSxD6LjvJ7YwSHPQTAC6g4eYAHDbrrVPCddoL
         wKBKnjSwRYX18YORcwkSWyTqYIjPvPnuE6g3DPKafms1p5PPqhmGVghU8pSl+8s8dKFe
         bGfbMyY9uFJ0blWdX53SvtOYSfrNszaPyyHovYoJYMa+vXD6sdoT1pW/zU11Twx1R7cN
         bm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=39duid3ev/LklZ+L3Q00JhOed86Qz5pMIsoTXShBt20=;
        b=KSW99bJpxl42OCfeM2Lx9wgWuMN5+1xz68CnNpSZ+0trvllOOsJaiHoeWeqwpRnNe1
         m/nKxVpjs8ehNBda8KNA+jZE+Tj2fNlL2L+6I2UCCIkxUqiGmaebzPHofRkiz2vFfpxH
         P6Par9nHmZexmauM/Da4A4G3f7P5h/i0lTF0EbGa4sfGrAkwrepdnKoArTR7YmPQrMAT
         0tAhCoF9Hs4yVtUrGQjy/F2r9VqLp+zNc8ChMt+0sP95vqkn56c20LNFhtyZ8TjxI8A1
         oRAW4obw/O6B/hyplFYut3OeqEqD11S1VrNKYjWPUw0MZCC5zVhHMiOnnUM52MM4NF1w
         fwDA==
X-Gm-Message-State: ACgBeo2iuGOu1JY2wvYljRTBHecLIvW/Yq+TQvleiUOQWsRK7XI5Lv2g
	S4oRGit++LYZwFzcVcKMCTY=
X-Google-Smtp-Source: AA6agR5XGcrPcCTucmMNTTVJjePtpk2URT/+5LvA1qYXREbgCp1yEieKssKuUeSmXOyebR58PIKgyg==
X-Received: by 2002:adf:fc08:0:b0:21e:d133:3500 with SMTP id i8-20020adffc08000000b0021ed1333500mr1487297wrr.353.1660822806671;
        Thu, 18 Aug 2022 04:40:06 -0700 (PDT)
Received: from debian (host-78-150-37-98.as13285.net. [78.150.37.98])
        by smtp.gmail.com with ESMTPSA id r5-20020a05600c35c500b003a5b6086381sm5337183wmq.48.2022.08.18.04.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 04:40:06 -0700 (PDT)
Date: Thu, 18 Aug 2022 12:40:04 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Chih-Kang Chang <gary.chang@realtek.com>,
	Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@kernel.org>
Cc: Yan-Hsuan Chuang <tony0620emma@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	clang-built-linux <llvm@lists.linux.dev>,
	Nathan Chancellor <nathan@kernel.org>
Subject: build failure of next-20220818 due to 341dd1f7de4c ("wifi: rtw88:
 add the update channel flow to support setting by parameters")
Message-ID: <Yv4lFKIoek8Fhv44@debian>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

Not sure if it has been reported, clang builds of arm64 allmodconfig have
failed to build next-20220818 with the error:

drivers/net/wireless/realtek/rtw88/main.c:731:2: error: variable 'primary_channel_idx' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
        default:
        ^~~~~~~
drivers/net/wireless/realtek/rtw88/main.c:754:39: note: uninitialized use occurs here
        hal->current_primary_channel_index = primary_channel_idx;
                                             ^~~~~~~~~~~~~~~~~~~

git bisect pointed to 341dd1f7de4c ("wifi: rtw88: add the update channel flow to support setting by parameters").
And, reverting that commit has fixed the build failure.

I will be happy to test any patch or provide any extra log if needed.


--
Regards
Sudip
