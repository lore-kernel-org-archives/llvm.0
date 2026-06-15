Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619FB405C23
	for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781537591; cv=none; b=QF/z5xcvFC9bhd7+KqYi9cgyPQyQe+1IxHcPXFHJIWFTBMXqc5sXQ4RQ+LxmvaF4RZHHdNpmq3DUmHXX6UvYtMKvJDUoXri1M6scDHEYVjSmH4zGi75LnRcFsCoDkcIiiYsKJ8U/hNyVStwRD5dqsAzcWkFANNt+4mzvUmveGHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781537591; c=relaxed/simple;
	bh=4vdtIk7OosnzuKzNbDWbpM0YHVHCalG6T7JKMJv23go=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=k/xleSSwWmd6sAV2/Avpbikh6IHVloEU33Sc9ct4Uo+cXcnABI1gQZClodJnS0RdZATF1etX0dUtCK2Xog9TJit/nF4b0Udwu8e8iv1nuSP3YoCRdH6c0VAXqBMqLsWdzmroFYo90zvkIhr8QU13k2fbYHFiAz0QIj6yDdiqc/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GvEMD8ex; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GvEMD8ex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781537589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DpdJ+hjOKxbT4CB7gdBwfs5kzrdZplfBZiUE1eMQXek=;
	b=GvEMD8ex7ihx2iR/wsud37ZiladBeC91m/YRnk0GNBFFuOQTdKMAx35eFW1R7EDGUWphvW
	+4yPDMcoVenLDUGuxpRdU1E/FUpKxKBvNcKYxibRn2L9j0z0Gi+yn8q4lCV4U80LyBxvwa
	r5QnSsxIW5xIJJ0yAsgYWE0WHKgiMgg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-185-0TQSyv0hNPmp58-qtYajRw-1; Mon,
 15 Jun 2026 11:33:07 -0400
X-MC-Unique: 0TQSyv0hNPmp58-qtYajRw-1
X-Mimecast-MFC-AGG-ID: 0TQSyv0hNPmp58-qtYajRw_1781537587
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1CD3818005BC
	for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 15:33:07 +0000 (UTC)
Received: from [172.20.99.234] (unknown [10.30.44.221])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B53C618005B6;
	Mon, 15 Jun 2026 15:33:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 95e56f0f)
Date: Mon, 15 Jun 2026 15:33:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <51370.126061511330701751@us-mta-185.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _FpxqC6NhXPPchaQPZWW7x_HIC4rK78G7ubxdZG1YIA_1781537587
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'kcsan-20260612-v7.2-rc1' of git://git.kernel=
.org/pub/scm/linux/kernel/git/melver/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2600954334

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2600954334_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: xfstests failures generic/32{6..8}
            URL: https://redhat.atlassian.net/browse/RHEL-50644
            Affected tests:
                xfstests - xfs [x86_64]
        Issue: mkfs.xfs prints warning about invalid stride unit, hardware =
specific
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1924
            Affected tests:
                xfstests - xfs [x86_64]
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
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

