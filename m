Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4B73B1B3
	for <llvm@lists.linux.dev>; Mon,  8 Jun 2026 03:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780890801; cv=none; b=bQKSaiviW7ihtQajcbqod4SSxPayMLVmXDvTrpcfMuU8036KazAbKRaf/gSApu5R9CBLNoHULLrZ0sZ0i2IgaNYBTdGy09MRKxNkka1bEef+5kDkWNEPp9aAp5IZ5F1c3PCoaRdthDzh+Qq2E0YEWqekml/DWHL9hCvomlW8OC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780890801; c=relaxed/simple;
	bh=sI5iSVEhEae8cR2aVCw2j6V2qBn9l8cDf8UmtB4x/eg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=LiMwP1D0jMqqg2JShRtNagEPZjdsH0A5HzISlGYcH88OMTziKyKZxEFzmmYPrqbsGHR+lC22qq4o3VcHAWcc/iNc7gphe+R5L45JuOt9bwwkAZGNcStLbjiF/7jYtCakPKn7b9sTSPzAa/34/eiTdXiTqmJVIdQdimJNc35dqW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hnGcIa5j; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hnGcIa5j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780890798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xm+VTY/kNWqAcfybaLRgjYKnfq4rG86F9BnoJ2KzmyI=;
	b=hnGcIa5jpj1XMeFPDvAr6bL6j+9x7+GVWjdbKtoACUJ+VYvpdQJbSCVzUHqYob8BKHCU6W
	0OSxK4nWPxlvEDkLEAIOR8NxFGB+acCyUERQmQP33Wt9xJwUrRimnLOy3Hw1bTOGlHG4J5
	eKQWSR4igqdpdkVH8vTdEs0ZTKift+s=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-35-BlGRLEGmPByza7-jsOwUeg-1; Sun,
 07 Jun 2026 23:53:07 -0400
X-MC-Unique: BlGRLEGmPByza7-jsOwUeg-1
X-Mimecast-MFC-AGG-ID: BlGRLEGmPByza7-jsOwUeg_1780890786
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 48CCA1800370
	for <llvm@lists.linux.dev>; Mon,  8 Jun 2026 03:53:06 +0000 (UTC)
Received: from [172.20.145.56] (unknown [10.30.45.118])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AC1D6195608E;
	Mon,  8 Jun 2026 03:53:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc6,
 upstream-mainline, 33d8d8ec)
Date: Mon, 08 Jun 2026 03:53:05 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <26438.126060723530700165@us-mta-35.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hFHNzRX6iDKU6fMxAPRl4RbDRwhv58WLyeYN3PVjOIA_1780890786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'input-for-v7.1-rc6' of git://git.kernel.org/=
pub/scm/linux/kernel/git/dtor/input

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2583089563

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2583089563_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2583089563_x86_64_kernel_kcidb_tool_21424793_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2583089563_aarch64_kernel_kcidb_tool_21424789_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



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

