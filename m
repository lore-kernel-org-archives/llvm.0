Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58842219EB
	for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 08:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769762001; cv=none; b=oNm3CNphxyTrxSe1z1pGN7uLnKLknyMsKc2FkuDzQWYAfvZ8/tpZLk+64883UY0Ujf1CS9qxWNbCMND9OJuoM4Xab3PWAQPcHG6DxgQhx9TcgADYacXgUURgPadrE5FbYWGZGOVXYfnV4H8XCZ5hEy2D/H+pbR4RaTOUrKRwvVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769762001; c=relaxed/simple;
	bh=ilUb25MdL2FidLniPBJD2YUREpfQC458hR2G/+nwbLE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=EZi+WLVv/dyJPW6YJ7QaiN6kQtHoTVR71/IzpAau+bzPvxpeOe9BJeWw9NVUlLCvJrpcgQDaB1kfc9rcrWnnX6NNMej1FRn15JXiEVEdOh6Jz9Ic67rmvanQbCUbIxxnZ8QpmSoHMzH2/Wa0uW+K6LsyXLw68gQt0croeh/MkGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cog7DInE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cog7DInE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769761999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z0Jdx4utyqxvYd7dnnjTQeHPcHLjVenI4wsfGYgMpgs=;
	b=cog7DInEK75MPVN507K7T8Ksj+PEE7wuN1SqlVG7X5PME32ah+7hXxgDN6xwP4uoMwF1ug
	JakPJo7Z0tw36lXTO80OdgGMX3cJmaBX0CmSrZzMndklqeQm5mkj5kKV6auKchatyebBdD
	Vf5S1eE1PvEcN+8YPFnUo/nOqt/AcW4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-CmfKqiA4Mq6Ra4fSXtdT6Q-1; Fri,
 30 Jan 2026 03:33:17 -0500
X-MC-Unique: CmfKqiA4Mq6Ra4fSXtdT6Q-1
X-Mimecast-MFC-AGG-ID: CmfKqiA4Mq6Ra4fSXtdT6Q_1769761996
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 75BE31954237
	for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 08:33:16 +0000 (UTC)
Received: from [172.20.60.237] (unknown [10.30.45.107])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EE88E1800965;
	Fri, 30 Jan 2026 08:33:15 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.19.0-rc7,
 upstream-mainline, 8dfce899)
Date: Fri, 30 Jan 2026 08:33:15 -0000
To: ftjahjad@redhat.com, bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <58688.126013003331700658@us-mta-681.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pqWIMIPVCaA09MoOME9tE2uUWf4BcIygk9CgDS4E2CM_1769761996
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'pinctrl-v6.19-3' of git://git.kernel.org/pub=
/scm/linux/kernel/git/linusw/linux-pinctrl

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2292262651

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2292262651_s390x_kernel_kcidb_tool_20556554_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { getattr } for comm=3D"rpcbind" name=3D"/" dev=
=3D"pidfs" ino=3D1 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsys=
tem_u:object_r:pidfs_t:s0 tclass=3Dfilesystem permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417839
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: fedora rawhide - nfsv4.2 failed to update ctime when calling=
 futimens
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417851
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
        Issue: xfstests nfsv4.2 generic/309 FAIL on 6.19.0
            URL: https://lore.kernel.org/linux-nfs/20251219175955.4480-1-ok=
orniev@redhat.com/
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]



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

