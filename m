Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7421B81B2
	for <llvm@lists.linux.dev>; Fri, 13 Dec 2024 23:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734132957; cv=none; b=jfqIuYp1L6SUvXux+1wTUqa6DrcJWKy0BygA+kLgxrNBlpQSmHhtSMmw6m11C/mKYSjLV7aLK0LHOazofSwai5uLJou+ASiDs2sCTUzlf47Yz+XHPZLK9oowzAYJxKuBS3/FcvUQBbNjCLmK3vwIms2w+6GvIeU4QpOe1aOLH9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734132957; c=relaxed/simple;
	bh=0j+16PpN+91mUK3wyIrIzkLt+SoJgk/lLKUzYw0f3S4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TEKDOWR5zRr+qCS4k4iZqJsnNLSGfFX9DCuydVCBMdlC+O9pNOJeVBdsHJqNnJSiMKtcc3nc8olmT/x2uJJD2iPOKqR6vMZJTbZ9E+dieX/uDD5b82U9YvMB07oVdQaWTvMnk9DW8/I/Xlk0wB9sZj3pbT/8sGarhl4YWzbHI9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fsi/OekS; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fsi/OekS"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fd49d85f82so1844493a12.3
        for <llvm@lists.linux.dev>; Fri, 13 Dec 2024 15:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734132954; x=1734737754; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PTFT9yz4pM1OFjc+buOwPNQT6jdZkXPwXL3n28Tfbzs=;
        b=Fsi/OekS4SHUH9KLBvFPHin7pFvxyQ4RLHtur7mO32TI37ZCdOo5AdqE6C63vfqhYI
         amJbk3MupddeadTT5fmKcM8O4WLXRO57wqGbzXYRc3OiYHsD5pVZvpQYP0bky2RNcVAE
         ykDmFQwbjwIb6kmeGiC2u56lKUWnQV8pW4CSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734132954; x=1734737754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTFT9yz4pM1OFjc+buOwPNQT6jdZkXPwXL3n28Tfbzs=;
        b=hrOsau2lFtuK0H3TDTrkVy/zQdCtDKqm7qp4tmcaBKHGJzd3arieNXg4+iegbWna1j
         ugmL3bm2YQ85a4CRUSAydmcitPmk1rUct1Ag/vz2203uNKxRwk22Q62Rsj8ZlRTTavnE
         PmYSqLQk0WqPrpvjQJ6G5AqrYrcUyd3R0awWVZHUsPT9aM6esRznlwj/me5W4C5u5mu3
         ZBZe5wn9yM2k6GtIN+PAZJ2w9Lbikm9jVKVlQdhKdo3Ivz1uMR0cw/RK1PjdRHcgR1wT
         djoFBtcy2QuClujmprNbqL+QRTXdmaa+i7n6tCIPIe1OVXAEdHLrSx7fmUQo9fyxEvPL
         K8AA==
X-Forwarded-Encrypted: i=1; AJvYcCUdhgASDpL0CcgWmekKF4DuetgJiWw4uqFIjstTr71Orw2yh6fwuKBylbAe4Nd//ij7wEd5@lists.linux.dev
X-Gm-Message-State: AOJu0YxNQtcxwMB3V2cWpInyemOO6HAXmnY+AMs/0KfwjPYo6iNmDskw
	GaIpwFGPvaKu7j4Js5EalWNrW8wlasYXWIXl5fCzv0OJVfaO2uNlELUN2L2jeA==
X-Gm-Gg: ASbGnct2xq2DPTPap7Dd3MWIv9C3BVtAeKp8wAVmCQ4p4sxkx08GUVGV2MghW4SLo9+
	EdDWrZz4fIIE4YELU6EhShSScKTbD9GVKB/9G9ffSslGMEFYF+Q8vNRA/IUH32jefeRHQg9hCWq
	sILVkgAkxzI0NO4aTBXiAwPeSTZ6bMRdrX+QZ4wrsZA5OX5WazR8RJhI1cjkDTxKEo3ZD2va3Ml
	Z/rS10rim4oVR1d8fIIBpfqrjqQ0KT7tOy9zX584GaodoxaNMQgs1WzDBkSspcBo/+YQwKAjfbt
	wEEG1SNMbfQq6isfJTJEUJqLJWcCDLs=
X-Google-Smtp-Source: AGHT+IG5j4AMarUnG2ZSC8v4QEARGsFW4ax9MqO8wiJjh8pP/1TphunmTJECxAqe49LgP2wG4I0BzA==
X-Received: by 2002:a17:902:e542:b0:211:3275:3fe with SMTP id d9443c01a7336-21892a22a56mr48820505ad.17.1734132954576;
        Fri, 13 Dec 2024 15:35:54 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-218a1dcb1c0sm3024755ad.65.2024.12.13.15.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:35:54 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	sboyd@kernel.org,
	pmalani@chromium.org,
	badhri@google.com,
	rdbabiera@google.com,
	dmitry.baryshkov@linaro.org,
	jthies@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Bill Wendling <morbo@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 0/8] Thunderbolt and DP altmode support for cros-ec-typec
Date: Fri, 13 Dec 2024 15:35:41 -0800
Message-ID: <20241213233552.451927-1-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hi Heikki, Tzung-Bi et al,

This patch series adds support for alternate mode entry for the
cros-ec-typec driver for Displayport and Thunderbolt.

Thunderbolt support is added by adapting an RFC Heikki had posted
previously:

https://lore.kernel.org/linux-usb/20191230152857.43917-1-heikki.krogerus@linux.intel.com/

A few comments on the series:

* The cros-ec interface will not accept any VDOs/VDMs so we simply
  ignore any configurations we are passed (i.e. DPConfigure). This means
  the sysfs control of DP lanes won't work.
* ChromeOS has two modes of operation for alt-modes: entirely EC driven
  or AP-driven from userspace (via the typec daemon). Thus, we don't
  expect the kernel alt-mode drivers to auto-enter modes in all cases.
  This series allows auto-enter for displayport but disables it for TBT
  for this reason.

This was tested with a ChromeOS Brya device using kernel 6.6 and built
with allmodconfig for linux-usb.

Thanks,
Abhishek

Changes in v5:
- Rebase with module_alias_printf
- Add lockdep, missing includes and fix up block comment style.
- Extract port altmode ".active" changes to its own patch
- Put dev_err on single line.
- Slip clang-format a washington to look the other way.
- Use list_for_each_entry and simplify conditional statement within
- Include missing headers for altmodes
- Consistent use of `adata` for altmode data
- Fix incorrect alloc size of dp_data

Changes in v4:
- Large refactor to use cable_altmodes
- Fixed ordering of cable mode enter/exit (SOP', SOP", then port for
  enter; reverse order for exit)
- Other small fixes from v3 feedback
- memset struct typec_altmode_desc
- Add CONFIG_CROS_EC_TYPEC_ALTMODES for Makefile use
- Move ap_driven_altmode check to common vdm function
- Add locking to protect shared data
- Update enter/exit error messages
- Update Makefile + Kconfig to use CONFIG_CROS_EC_TYPEC_ALTMODES
- Add locking in vdm function

Changes in v3:
- Removed mode from altmode device ids
- Updated modalias for typecd bus to remove mode
- Re-ordered to start of series
- Revert rename of TYPEC_TBT_MODE
- Remove mode from typec_device_id
- Refactored typec_altmode_dp_data per review request
- Removed unused vdm operations during altmode registration
- Fix usage of TBT sid and mode.
- Removed unused vdm operations during altmode registration
- Set port.inactive = true instead of auto-enter.

Changes in v2:
- Update altmode_match to ignore mode entirely
- Also apply the same behavior to typec_match
- Use <linux/usb/typec_tbt.h> and add missing TBT_CABLE_ROUNDED
- Pass struct typec_thunderbolt_data to typec_altmode_notify
- Rename TYPEC_TBT_MODE to USB_TYPEC_TBT_MODE
- Use USB_TYPEC_TBT_SID and USB_TYPEC_TBT_MODE for device id
- Change module license to GPL due to checkpatch warning
- Refactored displayport into cros_typec_altmode.c to extract common
  implementation between altmodes
- Refactored thunderbolt support into cros_typec_altmode.c
- Only disable auto-enter for Thunderbolt
- Update commit message to clearly indicate the need for userspace
  intervention to enter TBT mode

Changes in v1:
- Delay cable + plug checks so that the module doesn't fail to probe
  if cable + plug information isn't available by the time the partner
  altmode is registered.
- Remove unncessary brace after if (IS_ERR(plug))

Abhishek Pandit-Subedi (7):
  usb: typec: Only use SVID for matching altmodes
  usb: typec: Make active on port altmode writable
  usb: typec: Print err when displayport fails to enter
  platform/chrome: cros_ec_typec: Update partner altmode active
  platform/chrome: cros_ec_typec: Displayport support
  platform/chrome: cros_ec_typec: Thunderbolt support
  platform/chrome: cros_ec_typec: Disable tbt on port

Heikki Krogerus (1):
  usb: typec: Add driver for Thunderbolt 3 Alternate Mode

 MAINTAINERS                                  |   3 +
 drivers/platform/chrome/Kconfig              |   7 +
 drivers/platform/chrome/Makefile             |   4 +
 drivers/platform/chrome/cros_ec_typec.c      |  46 ++-
 drivers/platform/chrome/cros_ec_typec.h      |   1 +
 drivers/platform/chrome/cros_typec_altmode.c | 373 ++++++++++++++++++
 drivers/platform/chrome/cros_typec_altmode.h |  51 +++
 drivers/usb/typec/altmodes/Kconfig           |   9 +
 drivers/usb/typec/altmodes/Makefile          |   2 +
 drivers/usb/typec/altmodes/displayport.c     |   4 +-
 drivers/usb/typec/altmodes/nvidia.c          |   2 +-
 drivers/usb/typec/altmodes/thunderbolt.c     | 388 +++++++++++++++++++
 drivers/usb/typec/bus.c                      |   6 +-
 drivers/usb/typec/class.c                    |   9 +-
 include/linux/usb/typec.h                    |   2 +
 include/linux/usb/typec_tbt.h                |   1 +
 scripts/mod/devicetable-offsets.c            |   1 -
 scripts/mod/file2alias.c                     |   9 +-
 18 files changed, 885 insertions(+), 33 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_typec_altmode.c
 create mode 100644 drivers/platform/chrome/cros_typec_altmode.h
 create mode 100644 drivers/usb/typec/altmodes/thunderbolt.c

-- 
2.47.1.613.gc27f4b7a9f-goog

