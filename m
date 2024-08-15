Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F52014D2B3
	for <llvm@lists.linux.dev>; Thu, 15 Aug 2024 20:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723755134; cv=none; b=oURSUQpNfI2estZyAzjk8MMB4bFxjaTVJiuS7mrOaTn1OqpLQIFuoAEB7s6aB9hdijepiH79X7PczkbvVz6vg4Vrtqk5HT1PJl3VuZef+yfDrjxIUY36pcRTzMTQUuUvVS4HsVIX/yXxqczE2Pa/8XRlN9X9idNP7byZkZGhyIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723755134; c=relaxed/simple;
	bh=g3EEasCHzDhEFY0TzI2PlCEo91hocycaH11MZpLmVoU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=RKRcZJdr8T98NhRGkdmt4FYQcviGOrUP8RONRZOI55hAnn/u3vw3xwMBzbTQBdzW1AeFnT1yUbLHM6mw54R48Mvv34m2mokwcBa6aXQ5Wxa5qZ8BCdGlZUkbQna9oBLpbu9ZwUtezz+e9lgbvbMdfegzUoA7jrMYhAv5QrcTwOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UJ8uMV82; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UJ8uMV82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723755131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QeOzXDhNBO5YJ+s2XQPNRmq1qDQ4K345W5XG7QNFXxY=;
	b=UJ8uMV824l66wg2/RE/moy/6aOvpf6NDP1uT9r2eg4MVwSHvPkA85aAWJvksJmcJ4M4HDY
	dDZ75RbsiCl8FGPhhhO5HpAVyt87g7M8KzXiGY7+4jxHXoTJ6Gee67KybPzW8YxYWW8YGf
	hBYnNaHdays4TFWLbcNuiKtHbUCy+SA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-Rn-JvXVNO_SzrGaa2jeVuA-1; Thu,
 15 Aug 2024 16:52:09 -0400
X-MC-Unique: Rn-JvXVNO_SzrGaa2jeVuA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E0D5F1955D56
	for <llvm@lists.linux.dev>; Thu, 15 Aug 2024 20:52:05 +0000 (UTC)
Received: from [172.64.15.52] (unknown [10.30.34.46])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 888303001FE5;
	Thu, 15 Aug 2024 20:52:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc3,
 mainline.kernel.org-clang, e724918b)
Date: Thu, 15 Aug 2024 20:52:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <03066.124081516521000429@us-mta-624.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'hardening-v6.11-rc4' of git://git.kernel.org=
/pub/scm/linux/kernel/git/kees/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1415126369

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1415126369-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1415126369-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1415126369-x86_64-kernel-debug


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

