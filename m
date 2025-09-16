Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869812F25F1
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050476; cv=none; b=QdCe5oGG51z5uBX03P/oV/hRF7AZo0Ec78xcaFSCzgrbHTeIcgqplVxVBoDxfwUdC72me52eMN7Rl6tLjj+HC82KkH2YEAgJAPkM+FiPAKwh1nN5B7vKZ5MA5yGJi/rGuJRTs2LyTFZXYzukG2BWohpu5XEhCwV5k/rH29aunNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050476; c=relaxed/simple;
	bh=wsKvjaCe8eHyZ1GernzfUm5k/QysFdm4A6+iqiX9Vsk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ahrOMwqF+Dxh5tSCIk4Kv9R8CTxcpUQYiuO6MqKxJV5hpJPcOCY8DXCBr2fbE0ciQTs38ZuyESlMUi4/LlAPQzgAU2BdA2qJD6Udlc51PCLL3WQJOxYhjrOs8AqH6aqpicJS2tj+o6w+G+SQGocw45R2c/4YTaXPEI2AdEYpVQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WsURTKSG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WsURTKSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cu20hUniTYmxcRCtquYbXrs/sMK8m+9Fzo4PG8JVTNs=;
	b=WsURTKSG6CkexxoDNufodr0xiymQQsuxS8d+aWej4Lvnb4hsI3AGBzKjIknagQJv/hgeVr
	4RSS4tqF71YI4emIW8ao42Feh7occDSYAjlH23iDBFLJWiEAlQH6DJnQGhmQ7iMb6D2Imm
	ewa4bULWHZmH/2jb9ViWSIS+P2oGA1c=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-153-zJXz9sxoOT2HwaNfyzQBIQ-1; Tue,
 16 Sep 2025 15:21:11 -0400
X-MC-Unique: zJXz9sxoOT2HwaNfyzQBIQ-1
X-Mimecast-MFC-AGG-ID: zJXz9sxoOT2HwaNfyzQBIQ_1758050469
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AE370180057A
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:21:09 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2AA15195608E;
	Tue, 16 Sep 2025 19:21:09 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 20 of 137): Test report for master
 (6.16.0-0, upstream-mainline, d6084bb8)
Date: Tue, 16 Sep 2025 19:21:09 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <94494.125091615211100477@us-mta-153.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2Zr3jHo0YZ-6Dchdrgr7T4yGt4re51eR-sO_oJeIb3o_1758050469
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'fsnotify_for_v6.17-rc1' of git://git.kernel.=
org/pub/scm/linux/kernel/git/jack/linux-fs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1959919555

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1959919555_x86_64_kernel_kcidb_tool_19261921_33
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: [rawhide] avc:  denied  { getattr } for  pid=3D1215 comm=3D"=
sshd-session" path=3D"/var/lib/lastlog/lastlog2.db" dev=3D"sda6" ino=3D1175=
96106 scontext=3Dsystem_u:system_r:sshd_t:s0-s0:c0.c1023 tcontext=3Dsystem_=
u:object_r:var_lib_t:s0 tclass=3Dfile permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2379871
            Affected tests:
                Boot test [ppc64le]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:
    /distribution/check-install [x86_64]
    /distribution/command [x86_64]
    /test/misc/machineinfo [x86_64]
    Boot test [x86_64]
    CKI/restraint [x86_64]
    Reboot test [x86_64]
    SELinux Custom Module Setup [x86_64]
    selinux-policy: serge-testsuite [x86_64]
    xfstests - btrfs [x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [x86_64]


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

