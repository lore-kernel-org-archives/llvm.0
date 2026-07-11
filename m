Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F522F8E90
	for <llvm@lists.linux.dev>; Sat, 11 Jul 2026 05:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783748593; cv=none; b=cAbLoeqwi+igVfV0ag1BscWzT/1MczAWTh3ICQOeDR8ApeqibfXmQtQD9cwWknx0UadBcy+s11/a+kbp5Cpxv4fE4ZXHELNOzC/zNb63t7YEYbH/ulbl7q8gf4ZoNadeYzuF51mIdwNgNVjjYspIS9F56vSzpHEPv9VFA7wtCIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783748593; c=relaxed/simple;
	bh=l95iJnprqa2e6ZbhH5nmmCcGhHNSSt80hjNhTqjt890=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=EMN9CL1MXmkmbh2PE8WH/cLyR+keL5qx6Zh76XaTe42OrlOU0XNwP1TZZVIoWhvVLnSDo1+NpNV3IauvoeV+AOKBcru17Lzwrr2Jxr065kcDaMJlMzghr0PbvRWk+xRB0FzMFyUqfGql+v92B0xYGR0mxqv60cXmrDAzEEEztYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TanUgkgf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TanUgkgf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783748590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iHBsj/jVYWVgz2eXNTErmMXAqrHwyZKpFOC3NyUDkcU=;
	b=TanUgkgfcnso7MNUXb0M+2BmNaKGPe/9cZ7NrCQ6nnNtwBybn6ohrqVayYr03PyxEwmBzh
	jh0hKKJ3EDmcxOukRa7blA5XP4NP9+BBWokK7U19yKKTFYT8DbrImuPvqWIMhEMlB5hP+7
	Ngt6krLNjEmm13xxIXlb41nQI48ddp0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-683-NC8B34JbNy6aLSxf1c6pCw-1; Sat,
 11 Jul 2026 01:43:07 -0400
X-MC-Unique: NC8B34JbNy6aLSxf1c6pCw-1
X-Mimecast-MFC-AGG-ID: NC8B34JbNy6aLSxf1c6pCw_1783748586
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 999261805A10
	for <llvm@lists.linux.dev>; Sat, 11 Jul 2026 05:43:06 +0000 (UTC)
Received: from [172.20.146.15] (unknown [10.30.45.65])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D6E491800595;
	Sat, 11 Jul 2026 05:43:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc2,
 upstream-mainline, d96fcfe1)
Date: Sat, 11 Jul 2026 05:43:05 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <36800.126071101430700105@us-mta-683.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0jGzvU61PYybg2mKO_oRWd1H_ebr8CBj6qUkBH7LusA_1783748586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm=
/linux/kernel/git/arm64/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2668268688

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2668268688_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2668268688_x86_64_kernel_kcidb_tool_21621090_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
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

