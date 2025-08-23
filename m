Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471EBEEB2
	for <llvm@lists.linux.dev>; Sat, 23 Aug 2025 00:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755909133; cv=none; b=R2dFupOQJampY6IgAb2rP97eO5S9KrJ1i0kH7nSZFoNaT22Us8WYnnYuYqTKPx27nCigEHdfokCMYRTHeVDQ64/YS5aOHF4RKVXxP6ZdPYMTkGcx2vieNAoODEcL000eFYX2anN6lbNn0hy8WiSzAKA+rK7FxvEWSHsDylySbAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755909133; c=relaxed/simple;
	bh=dH68MXdvL0ZDuDe9a7OjyLeA9VR5m4Qg5+qKmH752pY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ZP0bz4oQeFOufItzSMrVfrT2tNqwinnEJc52GdpAXQ2zArt/3PhgDecXriiwerLfQDx7pJMUANQg1HWsolJoNXqHtaFxpkB/IaZaeKPrY7Qa+OFMoHSjKKORAIMJvTn5/A0Z/UJ3ysZ9YqnwuaE5H9SHaBc/78YbL83BzCJqNW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ORKzR6lS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ORKzR6lS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755909129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o4yVFI68aT84gzFQE82Qz4AEP6bAbGrPsvjacF+ju2M=;
	b=ORKzR6lSVsoqcCHjH4U9ws9G8/qPi4zmWuXMowngLXhBPLs622hOe4WWIKdO1ThjiQQPj0
	P1Cuxi8Z75yAs+1/eYGVhsEXCXxfnVJghZ+aNHsVkAPhScqopm8jKNDC7vnvRM2DZEVswK
	/3C2A6hJD7Q59o1MniZDDGQEQgzV3K4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-DT0d5Dy6Pc2PnZQi4BgBmA-1; Fri,
 22 Aug 2025 20:32:07 -0400
X-MC-Unique: DT0d5Dy6Pc2PnZQi4BgBmA-1
X-Mimecast-MFC-AGG-ID: DT0d5Dy6Pc2PnZQi4BgBmA_1755909127
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9939F19560B2
	for <llvm@lists.linux.dev>; Sat, 23 Aug 2025 00:32:06 +0000 (UTC)
Received: from [172.20.48.110] (unknown [10.30.45.91])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 247303001453;
	Sat, 23 Aug 2025 00:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.17.0-rc2,
 upstream-mainline, 6debb690)
Date: Sat, 23 Aug 2025 00:32:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <94235.125082220320701911@us-mta-614.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CX8SJHoH3VFnZ76LUAYZO2x_CNXs0HbNpDRTtaHFyWM_1755909127
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'drm-fixes-2025-08-23-1' of https://gitlab.fr=
eedesktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1999436691

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1999436691_aarch64_kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1999436691_x86_64_kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1999436691_x86_64_kernel-debug


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

