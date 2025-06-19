Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B2D1A5BB2
	for <llvm@lists.linux.dev>; Thu, 19 Jun 2025 01:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750297332; cv=none; b=uSQSpHrp3TuQKdoyc1aDPYjDuXE4GoJUJZ4pDc4iWoZnGFC85bBkf5oJmmbtYAYQ0XJTfj9pFfLFd8CM5mpvOkfhlAkDZlJ93qschjgwnIPPmzFQ4uJzgpV4JetM+4rOaa8Ei1GSStaCJ/wboV91CW20JYOyZC9BLf5lcRO6QbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750297332; c=relaxed/simple;
	bh=IIOSEHcLS6b+URhThxCXu2/ZDDauE2hpIxDTjEzremY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=efMa1TAQkfk2dqXiD+VCCxdeNlPJl3rhEQeSaWtGvDe9sUfcKfsFuUk6PPlESQ7oM9fwaw6cv7TfuTmZdZheYDsz/wLuS2JZYkw2M+8cAmaGGz+LWqG0q+3gSOTUeFl00eW3Hm3Q+ObufMUJsUli38X3dKDxeNVeNFryvZWSBME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IV59IMdZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IV59IMdZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750297329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ggqc9MancQt3n7E0yx0pUQEitkb7Re4moki1k12s5TY=;
	b=IV59IMdZajEUvGwIx6PVLwvrY2txvzXaqWmdP2oJTEEbEP8hT+Wvg7VzU2/7aaPKqvgoJd
	2s7VMKOUQ5sZSsTkozYQzkBOTBIBd0ygXNGjb0gd9uG9dV67i+OK59oaGfXMOteY0fCsKy
	ZcJW+vUbJe36522vzbxGWnbWJNk0mco=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-320-Osj8aFzYNsCuc4cBzmOgbw-1; Wed,
 18 Jun 2025 21:42:07 -0400
X-MC-Unique: Osj8aFzYNsCuc4cBzmOgbw-1
X-Mimecast-MFC-AGG-ID: Osj8aFzYNsCuc4cBzmOgbw_1750297326
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A203C1808993
	for <llvm@lists.linux.dev>; Thu, 19 Jun 2025 01:42:06 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4942330001B7;
	Thu, 19 Jun 2025 01:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 4 of 79): Test report for master
 (6.16.0-rc2, upstream-mainline, 74b4cc9b)
Date: Thu, 19 Jun 2025 01:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <32996.125061821420700285@us-mta-320.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 37tFjVunHLHj9_t8FLY40mEXuKKYu3MNSmbm6C2GzIc_1750297326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'cgroup-for-6.16-rc2-fixes' of git://git.kern=
el.org/pub/scm/linux/kernel/git/tj/cgroup

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1877487311

One or more kernel builds failed:
    Builds that are failing to boot:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1877487311-x86_64-kernel-debug

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    Reboot test [x86_64]


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

