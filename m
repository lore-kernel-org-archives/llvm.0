Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC4E18BC3D
	for <llvm@lists.linux.dev>; Sun, 19 Apr 2026 12:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776602534; cv=none; b=sLmLNx3wabQG2LzDxgcKd7J5hhguf/EXn9YCnTlrdGDFG81/iASHPwfI3qmF1baFhZJO+dADjpfxT5o9fPvziumWVCkChf6EwUlcEyBWbKr0VSUzTM3N9/q+DU+tvFTzoHZAGMMaZ+wSTm5beo1PX4s86lcDd5IyB902R4hVOjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776602534; c=relaxed/simple;
	bh=AEig/TIbs86jp3JyIli4QDMjFalBpN24U9Y6FFiyJvM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=rzE8FmpsgAQ60sQQUqOYUjPSF3rSqycty2XZs2WeN9Mxv4Et2EpTaNVdYwjD80cC5APLw6Ez+p/F8QJy2TrxkpaOgxJEUwJ40SebCSU7vFYhPL0kF+NfI9EWf0CEnPRBF7vSpUN/hlc3llMQeNM6T8X+jmgqIcxCPdOe8XBuulA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J0k03HRG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J0k03HRG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776602532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=219PWrRqVA/vWj7MpmFM95TbjzjV3hgMahhxAH7u+Xk=;
	b=J0k03HRG5k7n7F6J2ZH8Wez0hL/jlaK5EVezc9mjNU891uVWiYUQ+p9zDkYTgL3j45ez2C
	kh/shBb1D0dfE67PsUsaIEZ1zsMl8w+0jW2NjV1XYhUaOdBxbSWhiKEnAWT38eht42/Mkq
	NzCSjMln7R0gI5VUx5ftrbRJiyCDuus=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-435-qMiiRPjVO8CdVoakCik-oA-1; Sun,
 19 Apr 2026 08:42:10 -0400
X-MC-Unique: qMiiRPjVO8CdVoakCik-oA-1
X-Mimecast-MFC-AGG-ID: qMiiRPjVO8CdVoakCik-oA_1776602529
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A31AE18003FC
	for <llvm@lists.linux.dev>; Sun, 19 Apr 2026 12:42:09 +0000 (UTC)
Received: from [172.20.96.14] (unknown [10.30.44.37])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4EE3319560B1;
	Sun, 19 Apr 2026 12:42:09 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-0,
 upstream-mainline, faeab166)
Date: Sun, 19 Apr 2026 12:42:09 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <69690.126041908421000162@us-mta-435.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AgbJvuosFOx-fdOvNS0HT7HRdxcY48XVjgdkzmw3frA_1776602529
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'pinctrl-v7.1-1' of git://git.kernel.org/pub/=
scm/linux/kernel/git/linusw/linux-pinctrl

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2463026188

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2463026188_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: xfstests nfsv4.2 generic/309 FAIL on 6.19.0 as "mtime not up=
dated" and "ctime not updated"
            URL: https://lore.kernel.org/linux-nfs/20251219175955.4480-1-ok=
orniev@redhat.com/
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

