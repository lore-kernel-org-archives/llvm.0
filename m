Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A35296145
	for <llvm@lists.linux.dev>; Fri, 27 Jun 2025 10:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019794; cv=none; b=nHSPI7Al+OFSTrY2SZYRe576izXbsfs8aCyFALdBR75ft3pnZcdKz3TFgncVQRZL6eXExAerLihIpbD/mwzOIcQXYEtdIzDZh15fFIFA7Q8TrBakpWk7sRStGvaAozCaACtBOBgor25tSrVYOzaTwaXNl6iDlDoyqXwRQpoG7IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019794; c=relaxed/simple;
	bh=nhYp3TkjKvhB5WLPLJ2o3fCeJ0I0M64mQUZoFlmGPBk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=AIWnT5lpFL2SfCpMREr43QMoSMhwlsuYYSSyICGfDNIILiXcPUmOGlEXZG4XBn8lLA1ZgjeoLiQNPUIcKLasSq3nhwxKOPQPgi8viDtBoIVVCrqZb0MSTRkUnLtTsWlrPQVRlxVTWFQcy4AC/HtMfH/RJjBnU35iqXOQ6sckZRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RigS74ZA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RigS74ZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751019791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K24iIDpjj1YLN/ARrPr7Mn/nkCN3hYM+ikuDjrqugUA=;
	b=RigS74ZAzm3em8jOsznsVkSIeiS7ZoowemKRgvB2dWGYT4XMOYbiEEK0JjqsQXoCFOTkcv
	rStOT2ImyIE2SAxCMbELGTh5zIFCZhir0Tu/vVBGH/6Z4hF+DTxjFFIzpJ7/GTBuUFrgQj
	IWUScnfyerZJsWlYKt2bHxW3U/C8ViM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-76-kuSDZWaMPg6NzHdwsiy7-g-1; Fri,
 27 Jun 2025 06:23:07 -0400
X-MC-Unique: kuSDZWaMPg6NzHdwsiy7-g-1
X-Mimecast-MFC-AGG-ID: kuSDZWaMPg6NzHdwsiy7-g_1751019787
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB1A5180028F
	for <llvm@lists.linux.dev>; Fri, 27 Jun 2025 10:23:06 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 66F061944CE7;
	Fri, 27 Jun 2025 10:23:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (6.16.0-rc3,
 upstream-mainline, 6f2a71a9)
Date: Fri, 27 Jun 2025 10:23:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <15518.125062706230700269@us-mta-76.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mA1IvVkPOEAQKd3Xmujud7tPmXI5Ij_V-hfjvjSrccI_1751019787
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
    Commit message: Merge tag 'bcachefs-2025-06-26' of git://evilpiepirate.=
org/bcachefs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1893128276

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]



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

