Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47EB30DEAC
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 11:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776337329; cv=none; b=fOFl0esGwcHUVRt9L0XRG9KMKMXL0dJyYVS3v0v7UFEU0xvcnjeDcOZc4D19T8gksi9uXaf7gKtOvj1yElkYlG/xeCUJRVIEVg7KAIjpfEaQXt2V0Ucde3oPdFZeCqkZQjJQXMPImnyN+gKOODM5064pSqPaX1twH/SVeiY4LSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776337329; c=relaxed/simple;
	bh=Ny8SpNP87T5zpTyUBuAadFz36+uSMcg0zzZb3ZQXagE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=WtqTC31rHqaG+uEDbPOtD8XnwWNera+oxMk4bN8lEWU+qPGZJ0A+g8DDVXy4JTWXUD75IuQW74GQlKqMMFGG7eOxP43K7WKtdi5+4g1a0baj0oIOKAN0dfDLRxwx/ubx3sp7NIVQhVaF3AGKQPvc9mqEGQw2mW4envMm3Ou0lcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NzSXQiD+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NzSXQiD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776337327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hur/WSPu62IAAgXiQL9nc/L9ETbx8BGF27gkqnn4ROE=;
	b=NzSXQiD+b9yozt6vJ6s6WoOBmdc0Fw0zfrqpcEmYsaEyje+9qQXamXu9hPtnf7/ust1odz
	w77+jNjbzQROgO8+Cxc7nybOvWA11bRuWYPhFTpSm0pZa3VCKn6vx+fr1lgjeMe31eMngu
	lWnXtigYkSI2J9uE2mQd3cKKBrEG0N8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-30ThAHy6NUS3DU2cnIsrxg-1; Thu,
 16 Apr 2026 07:02:06 -0400
X-MC-Unique: 30ThAHy6NUS3DU2cnIsrxg-1
X-Mimecast-MFC-AGG-ID: 30ThAHy6NUS3DU2cnIsrxg_1776337325
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B797F1800366
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 11:02:05 +0000 (UTC)
Received: from [172.20.96.14] (unknown [10.30.44.37])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 20B0219560B1;
	Thu, 16 Apr 2026 11:02:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 88 of 97): Test report for master
 (7.0.0-0, upstream-mainline, 9e1e9d66)
Date: Thu, 16 Apr 2026 11:02:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <21126.126041607020602598@us-mta-627.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LrSr75ejqHTWyZtRcJ3BLVu-zJKiZYpvYf5cuGWmQTM_1776337325
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
    Commit message: Merge tag 'trace-rtla-v7.1' of git://git.kernel.org/pub=
/scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2456456139

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, ppc64le, s390x, x86_64]
    /distribution/command [aarch64, ppc64le, s390x, x86_64]
    /test/misc/machineinfo [aarch64, ppc64le, s390x, x86_64]
    Boot test [aarch64, ppc64le, s390x, x86_64]
    CKI/restraint [aarch64, ppc64le, s390x, x86_64]
    Reboot test [aarch64, ppc64le, s390x, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, s390x, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, s390x, x86_64]
    Storage - blktests - throtl [aarch64, s390x, x86_64]
    Storage - blktests - ublk [aarch64, s390x, x86_64]
    stress: stress-ng - cpu-cache [aarch64, s390x, x86_64]
    stress: stress-ng - memory [aarch64, s390x, x86_64]
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

