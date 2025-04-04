Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B32817578
	for <llvm@lists.linux.dev>; Fri,  4 Apr 2025 01:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743730935; cv=none; b=nWnLoWXYr2CfU1qbjw18LCuR4qFf5bno5u0mPphLCef9HnCXgjAbOryoswXt7ecOYy/zndkbvT2fwa0zE6gRPcdXb09e9cT8b6EfwsDkMWFzIYXS4b1x0jOQ0XWXzmrD7Fdjh8vBR7X13vRZ75xQCObUvLEh55aw6LEwp3TSYGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743730935; c=relaxed/simple;
	bh=GjZ0XO365ioVVVi2qJDwqLakmNzI7lFf3n3oVsCxlzw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=aSfSuV0Rt3/O+4+dDF46ssMvrJ8Iu5hrJdtsqAEgHisnyzt4zqZl09VCrUu/FrUH7ZI9fs9bKwRZ9qxtZ0YW4OF6bUyAbglVpp13D3vQb4lDCVlP4MdmszVStjsOJXdY0MTHGZBtiOqDgfapQ3FRSPBlmcu8CXVZ0XyF6fGi9TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NwUa1S6e; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NwUa1S6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743730930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/dOH2qQNFpPOQJfYr0ObhAVhGVkhYMlKNaAV9YM9cKc=;
	b=NwUa1S6eUHryzfgw4QQ1YlsL2HD6npvpD/j6Ve9u2wqNujlHB1EMyDm5dry/MgHeZFhdCf
	gF4q27C9s4nyEHxHda8s5s6u2XGLEJRIc4ZHkhesUM40tEPwZ6WKEfBNiSKyJO8hjbOeNR
	UzYyhZzRIZKxx+QWUwZPBjINCiUAczE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-213-GO57OfVbN4idoA7ea4RviQ-1; Thu,
 03 Apr 2025 21:42:07 -0400
X-MC-Unique: GO57OfVbN4idoA7ea4RviQ-1
X-Mimecast-MFC-AGG-ID: GO57OfVbN4idoA7ea4RviQ_1743730925
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 43087180AF56
	for <llvm@lists.linux.dev>; Fri,  4 Apr 2025 01:42:05 +0000 (UTC)
Received: from [172.20.219.140] (unknown [10.30.44.44])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C7E053000706;
	Fri,  4 Apr 2025 01:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 06a22366)
Date: Fri, 04 Apr 2025 01:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <57880.125040321420700231@us-mta-213.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qNhSK-qHI_uLsxr9mqo2Old6OAcPPepfzlj8GGrcb_I_1743730925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'v6.15rc-part2-ksmbd-server-fixes' of git://g=
it.samba.org/ksmbd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1751648789

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1751648789-x86_64-kernel-debug


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

