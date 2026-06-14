Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CDD13AA2D
	for <llvm@lists.linux.dev>; Sun, 14 Jun 2026 04:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781409796; cv=none; b=EkDgS9UszF2ch5O9Fg9Sg6uaSRC10T/axAp3TT7jGs+XQBPTF14ydvgxGicuitlR4kQfELdc5OMkxPf4+iDhMkwRiWt6bAmjEjRDK4QAJhA9JzqU0367Y+/yE1NyYPcmPRgKU4zzHCX5ASRsB+jmusNstoSKjx/uklIpqNx6RnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781409796; c=relaxed/simple;
	bh=Bl97CjhyGuc0qzD+by/FKUKGxt8ykK53SfiWHlBznJQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=KnnPbQUDQT5Nnn2uA7MdCQpOUqWGJceXFpr4tDgauQHIqp/yr37fh1SEC8hrcopDInrW5BWnbsJ3W50kKLqGwOI0fFVib9pWCIDkOh+Q37daHjPzlCUfq+9Bdjg10yoNOOVeLDZQho508qu94ZFloEgSOFraez5zMZSsXYdyrak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RSSJpFpn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RSSJpFpn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781409793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=scl0aG//M7pbLukk/y42Uai993lgf7l8ZCAr2k+cAfw=;
	b=RSSJpFpncJ0LaID/9BgemY7HJFXulGayOiF7z/eGrasgfFnEXIPUUyKvfe4GDTEfMF7UB3
	odEO4yYfTOfy1h7YHm+6yfs7gsek+TYzHj/t4YkRVYVDBOzllu30hNUjXsZMNl61+pK5iY
	fc7axccxNzEFicN6CHg81RbeRmC4Zrg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-212-O6KrMtgEPOaTWsofRixKqQ-1; Sun,
 14 Jun 2026 00:03:10 -0400
X-MC-Unique: O6KrMtgEPOaTWsofRixKqQ-1
X-Mimecast-MFC-AGG-ID: O6KrMtgEPOaTWsofRixKqQ_1781409789
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 20EF51954123
	for <llvm@lists.linux.dev>; Sun, 14 Jun 2026 04:03:09 +0000 (UTC)
Received: from [172.20.205.34] (unknown [10.30.44.235])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8369519560A2;
	Sun, 14 Jun 2026 04:03:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc7,
 upstream-mainline, 2b07ea76)
Date: Sun, 14 Jun 2026 04:03:08 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <92256.126061400031000189@us-mta-212.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DscP4ECw8wz3Brql_tIjDJPBY6h6JL05PocTOEDIYOY_1781409789
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'core-urgent-2026-06-13' of git://git.kernel.=
org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2599134996

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2599134996_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2599134996_aarch64_kernel_kcidb_tool_21462083_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
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

