Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69F11F5842
	for <llvm@lists.linux.dev>; Thu, 14 May 2026 07:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742192; cv=none; b=SZ2ozOY54JGjgemNoHKXtHKmHHL9RyN74nHLQngkiX6eRlgvpeqHFCJ0RAMuvSDPiVwYHz0mUG1zIgySCiRR300yJRfZZNH/uf2X0awlLZ4S14D5a8qmiO9nPjlk4+t0k+MG7vHHY362Gx9FHBVAiBTMKO14ZqfR8pF/bwOUoO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742192; c=relaxed/simple;
	bh=F+5Y3ic1hlNQFAFyDZtaqjvHvJBteYghaS7EP1iplwk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=IEbO+oeoaJSbxqMBV7yjK5AYuE3s8iXzgMMNbra1ypJ4FWv6sZT5kbxSuM7u+z4OeCYRY4OqalpuwcQ/QJn2Su6Um7mLPG3tPdUJkPnN1rRcLBtf+zrw54Ek3LZt157pT4xb0y/aoZ2aYkBv+jP1CioJRK01FtjJMnYdshIvkvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DtmS7gKk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DtmS7gKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778742189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cob4X3NIVxMMDquGTmot/+K+L6AyAUixCCjzWRZI2kA=;
	b=DtmS7gKkVqEQV8xGOm33Sl5z/06C4AqE4gQ1BYlFy20nz7Zfg3Uxt3AZ8CdPnwQkQ1E9eu
	SeuyUCWo933QApkXmI7r7X9TE5pH9HJfaTLhNqbIEavK1PMh3XWZAmbdAAaxFVMINLhyAz
	s80v6jOqRhHfaxxK1gjHaa/6i1T4XtA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-245-o_aoArY6Px-a-G6h0mmDRg-1; Thu,
 14 May 2026 03:03:08 -0400
X-MC-Unique: o_aoArY6Px-a-G6h0mmDRg-1
X-Mimecast-MFC-AGG-ID: o_aoArY6Px-a-G6h0mmDRg_1778742187
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 20E5E18005B2
	for <llvm@lists.linux.dev>; Thu, 14 May 2026 07:03:07 +0000 (UTC)
Received: from [172.20.187.136] (unknown [10.30.45.25])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A60B01800240;
	Thu, 14 May 2026 07:03:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc3,
 upstream-mainline, e1914add)
Date: Thu, 14 May 2026 07:03:06 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <40318.126051403030800243@us-mta-245.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JhfU7pfDduNMs59R7W4yNp2IcCSgvoFv2PYfmKUIvEU_1778742187
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/v=
irt/kvm/kvm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2523499434

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2523499434_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2523499434_aarch64_kernel_kcidb_tool_21280444_9
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
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
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

