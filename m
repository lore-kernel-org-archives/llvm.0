Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE0B13B284
	for <llvm@lists.linux.dev>; Mon,  2 Mar 2026 04:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772424188; cv=none; b=HcEejsO3yqOis1Mz7muzkhWgPS+zgyzTYxUlFnFymEh7TA7P6kaW7fZJF84QmsAmCgOFPo7aze6cHyG6UZMsWNwpGkkYdcrTRmBJ4mbH4Wmmlt6Z/a7W0Pu4/h8nvBt++2SaIh9EOpVGmT0OhPBljzemrK8fFgWzGQi9V/urdHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772424188; c=relaxed/simple;
	bh=65qjC7QCOGfnyL61CRen8kWXSQQE36mrFMt2PdDdSPg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=JDySUwoPDXNJ6f8zDhmSD0vaAaRBEQ6YC/397DCDkv1YJdEoYWuRquwgnI5U99849Ee+IgEYNrteRMjj6CZKHFM2nW79AAu8dev30QCxDxJ1WDjNmtfY1b/Dy122QfvgTo3aGhRZrnJnL63rWQJmiZwzD8hO8+MRtUeZZPxjFUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RJQlWnfd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RJQlWnfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772424185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2jZEyZMF2srCqE2fRW+KFYUSbe6+eB2Zz8/+quJv0ZY=;
	b=RJQlWnfdOyRT1J2Fb39R296UvJ9XFFFu3aUkl/7+rmgeRqJvM+JLEL7Wt8qftWkxzPSqGV
	cDj3+Sw25hNfypjw9sGalNY3q0COvlJgOukKvHKyLRKYe5GvpzrZvb2TzSdkOeoox4MBTE
	IzFq2SmgHk2BeTwfC+hy08KSJkSpkOU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-RH9XA_qZN9i2UQ0JeFMOuA-1; Sun,
 01 Mar 2026 23:03:04 -0500
X-MC-Unique: RH9XA_qZN9i2UQ0JeFMOuA-1
X-Mimecast-MFC-AGG-ID: RH9XA_qZN9i2UQ0JeFMOuA_1772424183
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A55691956095
	for <llvm@lists.linux.dev>; Mon,  2 Mar 2026 04:03:03 +0000 (UTC)
Received: from [172.20.96.208] (unknown [10.30.44.37])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3B7CE1800352;
	Mon,  2 Mar 2026 04:03:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc1,
 upstream-mainline, e2bd1b13)
Date: Mon, 02 Mar 2026 04:03:03 -0000
To: ftjahjad@redhat.com, bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <49032.126030123030400471@us-mta-584.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Wx5P3P5hiZvXOpEaK7oK_QQ7QikHcRSOII7MNHDTcSo_1772424183
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'core-debugobjects-2026-03-01' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2357191956

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_ppc64le_kernel_kcidb_tool_20775010_7
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_s390x_kernel_kcidb_tool_20775012_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_s390x_kernel_kcidb_tool_20775309_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_x86_64_kernel_kcidb_tool_20775007_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_x86_64_kernel_kcidb_tool_20775008_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_x86_64_kernel_kcidb_tool_20775009_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_aarch64_kernel_kcidb_tool_20775005_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_aarch64_kernel_kcidb_tool_20775006_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_aarch64_kernel_kcidb_tool_20775756_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Reboot test
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_ppc64le_kernel_kcidb_tool_20775010_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_s390x_kernel_kcidb_tool_20775012_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_s390x_kernel_kcidb_tool_20775309_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_x86_64_kernel_kcidb_tool_20775007_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_x86_64_kernel_kcidb_tool_20775009_12
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_aarch64_kernel_kcidb_tool_20775005_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_aarch64_kernel_kcidb_tool_20775006_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2357191956_aarch64_kernel_kcidb_tool_20775756_11
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

