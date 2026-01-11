Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9F329A9FE
	for <llvm@lists.linux.dev>; Sun, 11 Jan 2026 07:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768117399; cv=none; b=Dfnf4FMI1MVDFwbQ2i5qEpAp49ZjhurQUFaT/RlB4TeoCKbaRbIPzYoTdw2VSkUKNiIjDlOUzOLeHZWq3MkVPsOzQv4CT3CXOyyZM10eguNX9u0MBgI4hihQFXEoiX6tpYmvX0vEOUW8sJmbVgBQEOWfCGzUHtP7HV5NJADFcCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768117399; c=relaxed/simple;
	bh=ugkPbSBJniPasju+yESDGw3vU6+hzln4D+BOZqg6NtU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=kgqElvdVET0k3+yXo/BwWFNzlDv8aXOvRLZQ6bVEOp9CpGDe3rnoO6pqNfh8aq58uMEEbOkTvQXafLGw7V3Ad9+hNYZ8WOKL3ZOj858oyrGu+z29+Nmheutp+uXiGf16+TCADsHKdq4/qTvaKUsvKqEArR2mKIWs7rSlAKCBHrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eoxv8oSf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eoxv8oSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768117397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FCL362rm2yIa5L5rzaj7vrHDJOTLoC7fqduCdR77+5U=;
	b=eoxv8oSf2XcLitN9VhNHsOmkuYuDFp41nUsQD1lMw6Iui0qFaJKJnGPH/6L4PIFAXx9QU9
	ShOgV8zlLwdV00T0Dvj4AJW3dPtSuwvTN5mj8zfe/SWEsT+PErXOJndEMSy0ZueTHutZjh
	mtAg9Xi6heFUTpjTAX/+q5ms1DX7EUo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-SC7KsrA2MfqZMX-jniPwQw-1; Sun,
 11 Jan 2026 02:43:15 -0500
X-MC-Unique: SC7KsrA2MfqZMX-jniPwQw-1
X-Mimecast-MFC-AGG-ID: SC7KsrA2MfqZMX-jniPwQw_1768117395
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C822418003FC
	for <llvm@lists.linux.dev>; Sun, 11 Jan 2026 07:43:14 +0000 (UTC)
Received: from [172.20.95.168] (unknown [10.30.44.183])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6E6751956048;
	Sun, 11 Jan 2026 07:43:14 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (6.19.0-rc4,
 upstream-mainline, 97313d61)
Date: Sun, 11 Jan 2026 07:43:14 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <47382.126011102431500385@us-mta-175.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cyoA5Hocv_IJDmXIbTw5z_0J4QGdbs-2aqQqClCR1c8_1768117395
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
    Commit message: Merge tag 'iommu-fixes-v6.19-rc4' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/iommu/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2255704683

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [RHEL10.0] blktests throtl failed
            URL: https://issues.redhat.com/browse/RHEL-66783
            Affected tests:
                Storage - blktests - throtl [s390x]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [cki] [tests] unblocking setup-task failures (SELinux Custom=
 Module Setup|CKI/restraint|machineinfo|setup-nfsdump)
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/777
            Affected tests:
                /test/misc/machineinfo [aarch64]
        Issue: [rawhide] [aarch64] avc:  denied  { open } for  pid=3D14791 =
comm=3D"systemd-user-ru" path=3D"/sys/kernel/mm/transparent_hugepage/enable=
d" dev=3D"sysfs" ino=3D1784 scontext=3Dsystem_u:system_r:systemd_user_runti=
medir_t:s0 tcontext=3Dsystem_u:object_r:sysfs_t:s0 tclass=3Dfile permissive=
=3D1
            URL: https://redhat-internal.slack.com/archives/C04EX425HP1/p17=
65900650445969
            Affected tests:
                /test/misc/machineinfo [aarch64]
                Boot test [aarch64]
                Reboot test [aarch64]
                Storage - blktests - ublk [aarch64]
                stress: stress-ng - cpu-cache [aarch64]
                xfstests - btrfs [aarch64]
                xfstests - ext4 [aarch64]
                xfstests - xfs [aarch64]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
        Issue: avc: denied { getattr } for comm=3D"rpcbind" name=3D"/" dev=
=3D"pidfs" ino=3D1 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsys=
tem_u:object_r:pidfs_t:s0 tclass=3Dfilesystem permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417839
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
        Issue: fedora rawhide - nfsv4.2 failed to update ctime when calling=
 futimens
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417851
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

