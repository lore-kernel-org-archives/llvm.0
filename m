Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52421E5205
	for <llvm@lists.linux.dev>; Wed,  5 Nov 2025 04:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762317732; cv=none; b=NxxpVA4Fpnxqrowom/6EE68D9BvdKdXjhODQLhuwKEPGQYe9zogWzH7I1cRkG3DGqcm7Wqd/ipd6l/Jq8HENYmXhT9TAgAXVFQLvRRsKuQIYdqU6nx7SIEIlF5NbsIzFV/7C4aNo8xVZ7IkvHfVIkUF42SmdXeGovUu3eyUlSmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762317732; c=relaxed/simple;
	bh=8zfij2sTu+fC9IgeZNFSj6DV1Wypln/70sYfhaejqow=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=bc7KkaY+OgFToeDD1qD6H3zN2c639JiUvOdBJ8GqiGWgx33oTbZRa1DR3rPHW+aeWPgIm+7zyvInDHPzMHwEucDn78JL7ITB15HBQAKxctp/Q3WTMhvES/8W2bLKAQ3TVWoRFQDZ4Ge8l0tuotJ6FkLH1JYaibYyaNME3R+ahoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a7pju4kq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a7pju4kq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762317729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WtiefdYs7jWl+CY+phI2azokUR/A6+OaqFBIaW2xaD4=;
	b=a7pju4kqa52dOmUE5zR8SFq5M7oaTDJVDFP1hGIU5fwGBJtIuM+1o7xJyNychbYlY1D05A
	PYWpjUFKUKUEGdwWlg3O3Ao4mze0gh6irNjzZjQwntVJYOaWpMeqoeqzBJA5eh7SAKN1Bx
	cV6fcLEGLkwM8im5x5R8l+0jXOqL3io=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-602--KaPiZeEOkyk1YS9JQa60w-1; Tue,
 04 Nov 2025 23:42:08 -0500
X-MC-Unique: -KaPiZeEOkyk1YS9JQa60w-1
X-Mimecast-MFC-AGG-ID: -KaPiZeEOkyk1YS9JQa60w_1762317728
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A15C619560A7
	for <llvm@lists.linux.dev>; Wed,  5 Nov 2025 04:42:07 +0000 (UTC)
Received: from [172.20.90.15] (unknown [10.30.45.71])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4A24C195608E;
	Wed,  5 Nov 2025 04:42:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 21 of 137): Test report for master
 (6.18.0-rc4, upstream-mainline, 17d85f33)
Date: Wed, 05 Nov 2025 04:42:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <72600.125110423420800320@us-mta-602.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4n3HTnT2a8i4jACnePiUBjs6Jf87PI26kfAF6CuZUXE_1762317728
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
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/rdma/rdma

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2140069358

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] avc:  denied  { remove_name } for  pid=3D11534 com=
m=3D"systemd-ssh-iss" name=3D"50-ssh-vsock.issue" dev=3D"tmpfs" ino=3D2323 =
scontext=3Dsystem_u:system_r:systemd_ssh_issue_t:s0 tcontext=3Dsystem_u:obj=
ect_r:var_run_t:s0 tclass=3Ddir permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2391966
            Affected tests:
                Boot test [s390x]
                Reboot test [s390x]
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
        Issue: xfstests nfsv4.2 generic/221 failed to update ctime
            URL: https://issues.redhat.com/browse/RHELTEST-1805
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64]
                kselftests upstream - bpf_test_progs [x86_64]
                kselftests upstream - net [x86_64]


Tests that were not ran because of internal issues:
    /distribution/check-install [x86_64]
    /distribution/command [x86_64]
    /test/misc/machineinfo [x86_64]
    Boot test [x86_64]
    CKI/restraint [x86_64]
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    Reboot test [x86_64]
    SELinux Custom Module Setup [x86_64]
    Storage - blktests - throtl [x86_64]
    Storage - blktests - ublk [x86_64]
    stress: stress-ng - cpu-cache [x86_64]
    stress: stress-ng - memory [x86_64]


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

