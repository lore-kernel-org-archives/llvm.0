Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4173218BA
	for <llvm@lists.linux.dev>; Sun,  1 Mar 2026 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772366589; cv=none; b=OG4g5FyhxDEnnG+TbX30I7MrJsiE97zSIwXfCg/R448yQf/k6BmsXHyjw5Qdmx+pF7DvBexIbsO7/ZdQ4OCQDqFQOx0M6+2bhMJDIE8f2ghv2d0yjwtjDlReny+QfO5Vc7ebqDdKn77Z5VWsKsusjMYgB6PyfdENVLdt1cVLAfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772366589; c=relaxed/simple;
	bh=4cPQhieRxZCNnNVDRVMCziEZKwe1Fm2RLbLcMpjk8jg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lvQu4JSE0lj1Eh1ODlsb8BLhAO3OmJgnznOGvKHKsQx9Z3AyHgCbS+5dPeNu3+yxgBjRmLDCz3Ij/6M2ZkqhR7mNLLOaVSus9uCozWZB8roB46HdFDQPBg86KMxBb0zcOLwcJg2ZM2jXDEzVyahbklvMyvBsFvgp35mjsfL0NNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ghagvJg2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ghagvJg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772366585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i15zsJ3LP6Tv8NvWg2bxylKqXoc66DONJwxQyg8mMn0=;
	b=ghagvJg2CIwVdik1fonmXqiO/11fVgPMEFyp2c8ElvqomJoqS0YZGzn0f8GSpMeu2G9oP/
	4N+P0LldYyAYFTX3U4IyyXVPoA+XmP+EQIxg/2gy8/181MYEsiq9aqVtpXCEFOI/yHBXe6
	Xd3zEOcSfO6wl3uroQNyHYdy/Tyx48c=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619-tAsFTIzyOjOXFLpPtE3ScA-1; Sun,
 01 Mar 2026 07:03:04 -0500
X-MC-Unique: tAsFTIzyOjOXFLpPtE3ScA-1
X-Mimecast-MFC-AGG-ID: tAsFTIzyOjOXFLpPtE3ScA_1772366583
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 75BD01800451
	for <llvm@lists.linux.dev>; Sun,  1 Mar 2026 12:03:03 +0000 (UTC)
Received: from [172.20.201.171] (unknown [10.30.44.137])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C66B01800590;
	Sun,  1 Mar 2026 12:03:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc1,
 upstream-mainline, eb71ab2b)
Date: Sun, 01 Mar 2026 12:03:02 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <13340.126030107030400528@us-mta-619.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ck_RiOAbMQ43WMTZfongdEHFbMWGQNb7vgpydCWzTjk_1772366583
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'bpf-fixes' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/bpf/bpf

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2356464257

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356464257_s390x_kernel_kcidb_tool_20773104_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356464257_ppc64le_kernel_kcidb_tool_20773099_7
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356464257_aarch64_kernel_kcidb_tool_20773101_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356464257_x86_64_kernel_kcidb_tool_20773097_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356464257_x86_64_kernel_kcidb_tool_20773098_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Reboot test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356464257_s390x_kernel_kcidb_tool_20773104_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356464257_ppc64le_kernel_kcidb_tool_20773099_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356464257_aarch64_kernel_kcidb_tool_20773101_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356464257_aarch64_kernel_kcidb_tool_20773375_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356464257_aarch64_kernel_kcidb_tool_20773390_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356464257_x86_64_kernel_kcidb_tool_20773097_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356464257_x86_64_kernel_kcidb_tool_20773098_12
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356464257_x86_64_kernel_kcidb_tool_20773389_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check

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
                xfstests - nfsv4.2 [x86_64]
        Issue: avc: denied { getattr } for comm=3D"rpcbind" name=3D"/" dev=
=3D"pidfs" ino=3D1 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsys=
tem_u:object_r:pidfs_t:s0 tclass=3Dfilesystem permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417839
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: fedora rawhide - nfsv4.2 failed to update ctime when calling=
 futimens
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417851
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

