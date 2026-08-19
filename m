Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBAF3D3498
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 22:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787177592; cv=none; b=TgvsBtwWGi1KvaYeLbZchmfKWVkHCrCk2tneXBgnny0qjXKfJlmI9IijuCnco8KyBNFA4dv5d7wsXgAkkL3a7aT0HNphHnSWDJYwz/vEAR71ulibrKsZVEuozsH5m16RzCw/lCzXAPEjFGidPUlg52eDX2bI7RtZi1J3oq3wEbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787177592; c=relaxed/simple;
	bh=5eUoVe2J9JB5yzBOCOALgqYFCxCq5qlSuHkPHnm/AK4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=oP8tX4oDq5SLr7H/DA8qkf/FaqZPN6N3Chn1bF81tmM2xafXiBQVK8rFdCT8oyqDKsicpw4MP7t8IZyI1ZmGnpowBxy7RY5RFj4DBXZMHbNFkguuZ/xFVWcR+2lQ3boQdHoXjarGzQSbL+Azb6EAQ70/xxrjzATZz132CYjP244=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P7U4Vlrt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P7U4Vlrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787177589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WL5VQ3TuLrVU9DdDCgcn8CWerP0d87KfHuOmFoj1NNo=;
	b=P7U4VlrtSUsdEIYSzqPOXCIqJW+sv2tojrB7Hj+LmOyA0lH/TH9j7LoJvDkt6U3iBleZow
	kiboTMu6Z6xyo/uRZSiBHvQ5wQo0HzEo4GrvKu1KMbCDePO7+ISp/zvQMGUl7+qsegCup8
	jZtV3eKS+2rqcTdFt1Ljn5HQskqUE6I=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-539-WSZboWyeMj2Ohai-DLEbAA-1; Wed,
 19 Aug 2026 18:13:08 -0400
X-MC-Unique: WSZboWyeMj2Ohai-DLEbAA-1
X-Mimecast-MFC-AGG-ID: WSZboWyeMj2Ohai-DLEbAA_1787177587
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30F7019560B4
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 22:13:07 +0000 (UTC)
Received: from [172.20.61.140] (unknown [10.30.44.61])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AF124180049F;
	Wed, 19 Aug 2026 22:13:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 60 of 66): Test report for master
 (7.2.0-0, upstream-mainline, 98f21c54)
Date: Wed, 19 Aug 2026 22:13:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <86189.126081918130800385@us-mta-539.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UyYDU6ASFtR7HwtmZKRS6_atHvc6en_h9LT-h2H82zM_1787177587
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'for-linus-fwctl' of git://git.kernel.org/pub=
/scm/linux/kernel/git/fwctl/fwctl

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2774116627

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, x86_64]
    /distribution/command [aarch64, x86_64]
    /test/misc/machineinfo [aarch64, x86_64]
    Boot test [aarch64, x86_64]
    CKI/restraint [aarch64, x86_64]
    Reboot test [aarch64, x86_64]
    SELinux Custom Module Setup [aarch64, x86_64]
    selinux-policy: serge-testsuite [aarch64, x86_64]
    Storage - blktests - throtl [aarch64, x86_64]
    Storage - blktests - ublk [aarch64, x86_64]
    stress: stress-ng - cpu-cache [aarch64, x86_64]
    stress: stress-ng - memory [aarch64, x86_64]
    xfstests - btrfs [aarch64, x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [aarch64, x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [aarch64, x86_64]


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

