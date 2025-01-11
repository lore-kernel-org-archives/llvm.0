Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C374B14F102
	for <llvm@lists.linux.dev>; Sat, 11 Jan 2025 21:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736629929; cv=none; b=hfxvftl1pVifP1ViowOhKytq6KfMIrNGeMDeVK7x5ASfqKFqA4ECLZhtQBsXRLSvmg96fiDSJMuEwQLKnt3wlQDPNOoJlFJ1yXbgw1R+u0NifqtAyuMJyY4IjE3jVhMQ6K9Y1i5YI1g/glNWlKzqwtOuusM0pntPYzSaRJSCmCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736629929; c=relaxed/simple;
	bh=p8+BgX+X9/RgEiGEcJmxLyaY/FZSdSjIZsCSvZp9FVw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=p7Af0h0fuhESa9xT6328mvuHE07Y2GeupoJ/Zc50vooCl1cJST7X0Z9gt4N7TJ1B6wr1T1F/wmkyRxPwWHe5rw865phVmxXkzCfGxcjLcdE5Me/dFR+a4tHiGbmTj0+ut9qMAEWXmpJdmzYCdsC2TExx67K7eTL85AI9VFIwdAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e/f6ZE28; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e/f6ZE28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736629926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mvfjX8MikZqrrrYuAT2MhjkmDW3vJLRnlTpOnGVf0aE=;
	b=e/f6ZE28SQ7LoHzlb+NnNqonlGlma2PkAwVerRA/rusjddGM0zxkNAFje4MTwQ4d47jQNR
	JaWk/9klSctLkgBJqoj0/xf8w3t/rrhzCAS1E2LbN9FO4Wt26fclVM4DQm7MLQNPF1IseI
	F6wvVV8TBkjIslYC/j3B7n/DxMcf1ws=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-316-a5_VEoK-MpOjV41Rf3CE1Q-1; Sat,
 11 Jan 2025 16:12:04 -0500
X-MC-Unique: a5_VEoK-MpOjV41Rf3CE1Q-1
X-Mimecast-MFC-AGG-ID: a5_VEoK-MpOjV41Rf3CE1Q
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C1C40195608A
	for <llvm@lists.linux.dev>; Sat, 11 Jan 2025 21:12:03 +0000 (UTC)
Received: from [172.64.12.18] (unknown [10.30.33.24])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4D32A1956056;
	Sat, 11 Jan 2025 21:12:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc6,
 upstream-mainline, b62cef9a)
Date: Sat, 11 Jan 2025 21:12:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <67712.125011116120400673@us-mta-316.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xUFAamK4oL0oQVZgmk5V-fku2Sd1ytGPiw_d977XYlc_1736629924
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'hwmon-for-v6.13-rc7' of git://git.kernel.org=
/pub/scm/linux/kernel/git/groeck/linux-staging

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1621087540

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1621087540-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1621087540-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1621087540-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

